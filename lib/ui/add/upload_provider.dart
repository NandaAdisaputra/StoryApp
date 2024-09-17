import 'dart:typed_data';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:storyappsdicoding/repository/story_repository.dart';
import 'package:storyappsdicoding/utils/errors_helper/exceptions.dart';
import 'package:storyappsdicoding/utils/result_state.dart';

class UploadProvider extends ChangeNotifier {
  ResultState _state = ResultState.initial;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  final StoryRepository _storyRepository;

  UploadProvider({required StoryRepository storyRepository})
      : _storyRepository = storyRepository;

  Future<List<int>> compressImage(List<int> bytes) async {
    if (bytes.length < 1000000) return bytes;

    final img.Image? image = img.decodeImage(Uint8List.fromList(bytes));
    if (image == null) return bytes;

    int compressQuality = 100;
    List<int> newByte = [];

    while (newByte.length > 1000000 && compressQuality >= 0) {
      compressQuality -= 10;
      newByte = img.encodeJpg(image, quality: compressQuality);
    }
    return newByte;
  }

  Future<void> addStory(
      List<int> bytes,
      String fileName,
      String description,
      double lat,
      double lon,
      ) async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        _state = ResultState.error;
        _message = 'Tidak ada koneksi internet.';
      } else {
        final compressedImage = await compressImage(bytes);
        await _storyRepository.addStory(
          compressedImage,
          fileName,
          description,
          lat,
          lon,
        );
        _state = ResultState.success;
      }
    } on ServerException catch (e) {
      _state = ResultState.error;
      if (e.statusCode == 400) {
        _message =
        'Gagal menambahkan cerita: Ada kesalahan dalam permintaan Anda.';
      } else if (e.statusCode == 401) {
        _message = 'Gagal menambahkan cerita: Akses ditolak.';
      } else {
        _message = 'Gagal menambahkan cerita: Terjadi kesalahan pada server.';
      }
    } on ClientException {
      _state = ResultState.error;
      _message = 'Gagal menambahkan cerita: Periksa koneksi internet Anda.';
    } catch (e) {
      _state = ResultState.error;
      _message =
      'Gagal menambahkan cerita: Terjadi kesalahan. Silakan coba lagi.';
    }
    notifyListeners();
  }
}
