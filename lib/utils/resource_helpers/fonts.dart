import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSize {
  static const double s05 = 0.5;
  static const double s0008 = 0.008;
  static const double s0085 = 0.085;
  static const double s0045 = 0.045;
  static const double s008 = 0.08;
  static const double s006 = 0.06;
  static const double s005 = 0.05;
  static const double s003 = 0.03;
  static const double s08 =0.8;
  static const double s15 =15;
}
class MyTextTheme {
// Konstruktor privat untuk mencegah instansiasi
  MyTextTheme._();

  static const double _defaultLetterSpacing = 0.0;

  // Gaya teks untuk tampilan besar
  static TextStyle displayLarge = _textStyle(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );

  // Gaya teks untuk tampilan sedang
  static TextStyle displayMedium = _textStyle(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  // Gaya teks untuk tampilan kecil
  static TextStyle displaySmall = _textStyle(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  );

  // Gaya teks untuk headline besar
  static TextStyle headlineLarge = _textStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  // Gaya teks untuk headline sedang
  static TextStyle headlineMedium = _textStyle(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  );

  // Gaya teks untuk headline kecil
  static TextStyle headlineSmall = _textStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  // Gaya teks untuk judul besar
  static TextStyle titleLarge = _textStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  // Gaya teks untuk judul sedang
  static TextStyle titleMedium = _textStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  // Gaya teks untuk tubuh besar
  static TextStyle bodyLarge = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  // Gaya teks untuk tubuh sedang
  static TextStyle bodyMedium = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  // Gaya teks untuk label besar
  static TextStyle labelLarge = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );

  // Gaya teks untuk label sedang
  static TextStyle labelMedium = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  // Gaya teks untuk label kecil
  static TextStyle labelSmall = _textStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );

  // Metode privat untuk mengembalikan gaya teks dengan menggunakan Google Fonts
  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    double letterSpacing = _defaultLetterSpacing,
  }) {
    return GoogleFonts.merriweather(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}
