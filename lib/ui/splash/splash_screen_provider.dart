import 'dart:async';
import 'package:flutter/foundation.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  SplashScreenProvider() {
    _loadData();
  }

  void _loadData() {
    Timer(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}