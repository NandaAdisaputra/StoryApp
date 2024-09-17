import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:storyappsdicoding/model/list_story.dart';
import 'package:storyappsdicoding/repository/story_repository.dart';
import 'package:storyappsdicoding/utils/result_state.dart';

class DetailProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;
  late final BuildContext _context;

  DetailProvider({
    required BuildContext context,
    required StoryRepository storyRepository,
  })   : _context = context,
        _storyRepository = storyRepository;

  ResultState _state = ResultState.initial;
  ResultState get state => _state;

  ListStory? _story;
  ListStory? get story => _story;

  Placemark? _placeMark;
  Placemark? get placeMark => _placeMark;

  String _message = '';
  String get message => _message;

  Future<void> getStory(String id) async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final story = await _storyRepository.getStory(id);
      _story = story;
      final info = await onLatLongFetched(
        story.lon!.toDouble(),
        story.lat!.toDouble(),
      );
      if (info.isNotEmpty) {
        _placeMark = info.first;
      } else {
        throw Exception('Failed to get location info');
      }
      _state = ResultState.success;
    } on SocketException {
      final hasConnection = await _checkInternetConnection();
      if (!hasConnection) {
        _message = 'Tidak ada koneksi internet';
        _state = ResultState.error;
        showSnackBar(_message);
      }
    } catch (e) {
      _message = e.toString();
      _state = ResultState.error;
      showSnackBar(_message);
    }
    notifyListeners();
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<List<Placemark>> onLatLongFetched(double long, double lat) async {
    return placemarkFromCoordinates(lat, long);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }
}
