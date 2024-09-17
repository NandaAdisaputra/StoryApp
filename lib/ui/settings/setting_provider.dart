import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void set(Locale newLocale, BuildContext context) {
    try {
      _locale = newLocale;
    } on ArgumentError catch (e) {
      final errorMessage = 'Kesalahan saat mengubah bahasa: ${e.message}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    } on Exception catch (e) {
      final errorMessage = 'Terjadi kesalahan: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    } finally {
      notifyListeners();
    }
  }
}
