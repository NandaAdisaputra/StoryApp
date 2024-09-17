import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyappsdicoding/repository/auth_repository.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/result_state.dart';


class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  ResultState _state = ResultState.initial;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  bool _isLoggedIn = false;
  bool isLoading = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthProvider({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<dynamic> login(String email, String password, BuildContext context) async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      isLoading = true;
      final token = await _authRepository.login(email, password);

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        _state = ResultState.success;
        _isLoggedIn = true;
        isLoading = false;
        notifyListeners();
      }
    } on SocketException {
      _state = ResultState.error;
      _message =  AppLocalizations.of(context)?.noInternetConnection??"";
      isLoading = false;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      _message = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String name, String email, String password, BuildContext context) async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      isLoading = true;
      await _authRepository.register(name, email, password);
      _state = ResultState.success;
      isLoading = false;
      notifyListeners();
    } on SocketException {
      _state = ResultState.error;
      _message =  AppLocalizations.of(context)?.noInternetConnection??"";
      isLoading = false;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      _message = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final newIsLoggedIn = token != null && token.isNotEmpty;

    if (_isLoggedIn != newIsLoggedIn) {
      _isLoggedIn = newIsLoggedIn;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      Future.delayed(const Duration(seconds: 2), () {
        _isLoggedIn = false;
        _state = ResultState.success;
        notifyListeners();
      });
    } catch (e) {
      _state = ResultState.error;
      _message = e.toString();
      notifyListeners();
    }
  }
}
