import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:storyappsdicoding/model/list_story.dart';
import 'package:storyappsdicoding/repository/story_repository.dart';
import 'package:storyappsdicoding/utils/errors_helper/exceptions.dart';
import 'package:storyappsdicoding/utils/result_state.dart';

class HomeProvider extends ChangeNotifier {
  ResultState _state = ResultState.initial;
  String _message = '';
  final List<ListStory> _stories = [];
  int? _pageItems = 1;
  final int _sizeItems = 10;
  final StoryRepository _storyRepository;

  HomeProvider({required StoryRepository storyRepository})
      : _storyRepository = storyRepository;

  ResultState get state => _state;

  String get message => _message;

  int? get pageItems => _pageItems;

  List<ListStory> get stories => _stories;

  Future<void> getStories({bool isRefresh = false}) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw const SocketException('Tidak ada koneksi internet');
      }

      if (isRefresh) {
        _pageItems = 1;
        _stories.clear();
      }
      if (_pageItems == 1) {
        _state = ResultState.loading;
        notifyListeners();
      }
      final stories =
      await _storyRepository.getStories(_pageItems ?? 1, _sizeItems);
      _state = ResultState.success;
      _stories.addAll(stories);
      if (stories.length < _sizeItems) {
        _pageItems = null;
      } else {
        _pageItems = (_pageItems ?? 1) + 1;
      }
    } on SocketException {
      _setError('Tidak ada koneksi internet');
    } on HttpException {
      _setError('Tidak dapat terhubung ke server');
    } on FormatException {
      _setError('Respon server tidak sesuai format');
    } on ServerException catch (e) {
      _setError(_getErrorMessageFromCode(e.statusCode ?? 0));
    } catch (e) {
      _setError('Terjadi kesalahan: $e');
    } finally {
      notifyListeners();
    }
  }

  void _setError(String errorMessage) {
    _state = ResultState.error;
    _message = errorMessage;
  }

  String _getErrorMessageFromCode(int code) {
    switch (code) {
      case 400:
        return 'Permintaan tidak valid';
      case 401:
        return 'Tidak ada izin untuk mengakses sumber daya';
      case 403:
        return 'Akses ditolak';
      case 404:
        return 'Sumber daya tidak ditemukan';
      case 500:
        return 'Server mengalami kesalahan internal';
      default:
        return 'Terjadi kesalahan pada server';
    }
  }
}
