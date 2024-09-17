import 'package:flutter/material.dart';

class ResetPasswordProvider extends ChangeNotifier {
  Future<void> sendResetEmail(String email) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
