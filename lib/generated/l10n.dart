// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Story App`
  String get titleApp {
    return Intl.message(
      'My Story App',
      name: 'titleApp',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Access`
  String get noInternetAccess {
    return Intl.message(
      'No Internet Access',
      name: 'noInternetAccess',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Problem Occurred`
  String get problemOccurred {
    return Intl.message(
      'Problem Occurred',
      name: 'problemOccurred',
      desc: '',
      args: [],
    );
  }

  /// `No Data Restaurant Found`
  String get noDataFound {
    return Intl.message(
      'No Data Restaurant Found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Internet Connection!`
  String get checkYourInternetConnection {
    return Intl.message(
      'Check Your Internet Connection!',
      name: 'checkYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Restaurant not found`
  String get noDataFavorite {
    return Intl.message(
      'Favorite Restaurant not found',
      name: 'noDataFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Add Favorite Restaurant failed`
  String get addDataFavoriteFailed {
    return Intl.message(
      'Add Favorite Restaurant failed',
      name: 'addDataFavoriteFailed',
      desc: '',
      args: [],
    );
  }

  /// `Remove Favorite Restaurant failed`
  String get removeDataFavoriteFailed {
    return Intl.message(
      'Remove Favorite Restaurant failed',
      name: 'removeDataFavoriteFailed',
      desc: '',
      args: [],
    );
  }

  /// `Remove All Favorite Restaurant failed`
  String get removeAllDataFavoriteFailed {
    return Intl.message(
      'Remove All Favorite Restaurant failed',
      name: 'removeAllDataFavoriteFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get tryAgainLater {
    return Intl.message(
      'Please try again later',
      name: 'tryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please check your internet connection`
  String get requestTimedOut {
    return Intl.message(
      'Request timed out. Please check your internet connection',
      name: 'requestTimedOut',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Please check your network settings.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection. Please check your network settings.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Change to Light Mode`
  String get changeToLightMode {
    return Intl.message(
      'Change to Light Mode',
      name: 'changeToLightMode',
      desc: '',
      args: [],
    );
  }

  /// `Change to Dark Mode`
  String get changeToDarkMode {
    return Intl.message(
      'Change to Dark Mode',
      name: 'changeToDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `isDarkMode`
  String get isDarkMode {
    return Intl.message(
      'isDarkMode',
      name: 'isDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `light`
  String get lightMode {
    return Intl.message(
      'light',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `dark`
  String get darkMode {
    return Intl.message(
      'dark',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `DARK_THEME`
  String get darkThemeTitle {
    return Intl.message(
      'DARK_THEME',
      name: 'darkThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Detail My Profile`
  String get detailProfile {
    return Intl.message(
      'Detail My Profile',
      name: 'detailProfile',
      desc: '',
      args: [],
    );
  }

  /// `Nanda Adisaputra, S.Kom`
  String get nameProfile {
    return Intl.message(
      'Nanda Adisaputra, S.Kom',
      name: 'nameProfile',
      desc: '',
      args: [],
    );
  }

  /// `I am an Android Programmer, specialized in native Android applications. Graduated from the Dicoding Academy Google Developers Authorized Training Partner course. Best graduate of the S1 Informatics Engineering program at the 61st graduation of Semarang University with a GPA of 3.86 (Cumlaude) and a duration of 3.5 years.`
  String get descriptionProfile {
    return Intl.message(
      'I am an Android Programmer, specialized in native Android applications. Graduated from the Dicoding Academy Google Developers Authorized Training Partner course. Best graduate of the S1 Informatics Engineering program at the 61st graduation of Semarang University with a GPA of 3.86 (Cumlaude) and a duration of 3.5 years.',
      name: 'descriptionProfile',
      desc: '',
      args: [],
    );
  }

  /// `Visit My Linkedin`
  String get visitLinkedin {
    return Intl.message(
      'Visit My Linkedin',
      name: 'visitLinkedin',
      desc: '',
      args: [],
    );
  }

  /// `https://www.linkedin.com/in/nandaadisaputra/`
  String get urlLinkedin {
    return Intl.message(
      'https://www.linkedin.com/in/nandaadisaputra/',
      name: 'urlLinkedin',
      desc: '',
      args: [],
    );
  }

  /// `Helvetica`
  String get helvetica {
    return Intl.message(
      'Helvetica',
      name: 'helvetica',
      desc: '',
      args: [],
    );
  }

  /// `Detail Story`
  String get detailScreen {
    return Intl.message(
      'Detail Story',
      name: 'detailScreen',
      desc: '',
      args: [],
    );
  }

  /// `Search Story`
  String get searchScreen {
    return Intl.message(
      'Search Story',
      name: 'searchScreen',
      desc: '',
      args: [],
    );
  }

  /// `Add Story`
  String get addScreen {
    return Intl.message(
      'Add Story',
      name: 'addScreen',
      desc: '',
      args: [],
    );
  }

  /// `Map Story`
  String get mapScreen {
    return Intl.message(
      'Map Story',
      name: 'mapScreen',
      desc: '',
      args: [],
    );
  }

  /// `Profile User`
  String get profileScreen {
    return Intl.message(
      'Profile User',
      name: 'profileScreen',
      desc: '',
      args: [],
    );
  }

  /// `List Story`
  String get homeScreen {
    return Intl.message(
      'List Story',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get titleLogin {
    return Intl.message(
      'LOGIN',
      name: 'titleLogin',
      desc: '',
      args: [],
    );
  }

  /// `oAuthData`
  String get oAuthDataKeyStory {
    return Intl.message(
      'oAuthData',
      name: 'oAuthDataKeyStory',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get loginDataKeyStory {
    return Intl.message(
      'login',
      name: 'loginDataKeyStory',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeNavigation {
    return Intl.message(
      'Home',
      name: 'homeNavigation',
      desc: '',
      args: [],
    );
  }

  /// `Google Map`
  String get mapNavigation {
    return Intl.message(
      'Google Map',
      name: 'mapNavigation',
      desc: '',
      args: [],
    );
  }

  /// `Profile User`
  String get profileNavigation {
    return Intl.message(
      'Profile User',
      name: 'profileNavigation',
      desc: '',
      args: [],
    );
  }

  /// `Enter Story Description`
  String get enterDescriptionStory {
    return Intl.message(
      'Enter Story Description',
      name: 'enterDescriptionStory',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get addressStory {
    return Intl.message(
      'Address',
      name: 'addressStory',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionStory {
    return Intl.message(
      'Description',
      name: 'descriptionStory',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message(
      'Add Photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get uploadStory {
    return Intl.message(
      'Upload',
      name: 'uploadStory',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutStory {
    return Intl.message(
      'Logout',
      name: 'logoutStory',
      desc: '',
      args: [],
    );
  }

  /// `Problem Occurred`
  String get problemOccurredStory {
    return Intl.message(
      'Problem Occurred',
      name: 'problemOccurredStory',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get cameraStory {
    return Intl.message(
      'Camera',
      name: 'cameraStory',
      desc: '',
      args: [],
    );
  }

  /// `Something Went Wrong`
  String get somethingWentWrongStory {
    return Intl.message(
      'Something Went Wrong',
      name: 'somethingWentWrongStory',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get galleryStory {
    return Intl.message(
      'Gallery',
      name: 'galleryStory',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailStory {
    return Intl.message(
      'Email',
      name: 'emailStory',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameStory {
    return Intl.message(
      'Username',
      name: 'usernameStory',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get successStory {
    return Intl.message(
      'Success',
      name: 'successStory',
      desc: '',
      args: [],
    );
  }

  /// `Register Account`
  String get registerAccountStory {
    return Intl.message(
      'Register Account',
      name: 'registerAccountStory',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email.`
  String get enterYourEmailStory {
    return Intl.message(
      'Please enter your email.',
      name: 'enterYourEmailStory',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordStory {
    return Intl.message(
      'Password',
      name: 'passwordStory',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username.`
  String get enterRegisterUsernameStory {
    return Intl.message(
      'Please enter your username.',
      name: 'enterRegisterUsernameStory',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password.`
  String get enterYourPasswordStory {
    return Intl.message(
      'Please enter your password.',
      name: 'enterYourPasswordStory',
      desc: '',
      args: [],
    );
  }

  /// `Your password is less than six characters.`
  String get validationPasswordStory {
    return Intl.message(
      'Your password is less than six characters.',
      name: 'validationPasswordStory',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long.`
  String get validationRegisterPasswordStory {
    return Intl.message(
      'Password must be at least 6 characters long.',
      name: 'validationRegisterPasswordStory',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginStory {
    return Intl.message(
      'Login',
      name: 'loginStory',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerStory {
    return Intl.message(
      'Register',
      name: 'registerStory',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get successLoginStory {
    return Intl.message(
      'Login successful',
      name: 'successLoginStory',
      desc: '',
      args: [],
    );
  }

  /// `Account registration success`
  String get successRegisterStory {
    return Intl.message(
      'Account registration success',
      name: 'successRegisterStory',
      desc: '',
      args: [],
    );
  }

  /// `Location Not Found`
  String get locationNotFoundStory {
    return Intl.message(
      'Location Not Found',
      name: 'locationNotFoundStory',
      desc: '',
      args: [],
    );
  }

  /// `City of Semarang`
  String get semarangStory {
    return Intl.message(
      'City of Semarang',
      name: 'semarangStory',
      desc: '',
      args: [],
    );
  }

  /// `Current Location`
  String get currentLocationStory {
    return Intl.message(
      'Current Location',
      name: 'currentLocationStory',
      desc: '',
      args: [],
    );
  }

  /// `Searched Location`
  String get searchedLocationStory {
    return Intl.message(
      'Searched Location',
      name: 'searchedLocationStory',
      desc: '',
      args: [],
    );
  }

  /// `Search (ex: city name or specific location)`
  String get searchCityStory {
    return Intl.message(
      'Search (ex: city name or specific location)',
      name: 'searchCityStory',
      desc: '',
      args: [],
    );
  }

  /// `User created`
  String get userCreatedStory {
    return Intl.message(
      'User created',
      name: 'userCreatedStory',
      desc: '',
      args: [],
    );
  }

  /// `photoUrl-cache`
  String get photoUrlCache {
    return Intl.message(
      'photoUrl-cache',
      name: 'photoUrlCache',
      desc: '',
      args: [],
    );
  }

  /// `Location not found`
  String get locationNotFound {
    return Intl.message(
      'Location not found',
      name: 'locationNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Belum punya akun? Ayo`
  String get notHaveAccount {
    return Intl.message(
      'Belum punya akun? Ayo',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Masukkan Email Anda`
  String get enterEmail {
    return Intl.message(
      'Masukkan Email Anda',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email tidak boleh kosong`
  String get emailCannotBeEmpty {
    return Intl.message(
      'Email tidak boleh kosong',
      name: 'emailCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Masukkan email yang valid`
  String get enterValidEmail {
    return Intl.message(
      'Masukkan email yang valid',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Kirim Email Reset Password`
  String get sendPasswordResetEmail {
    return Intl.message(
      'Kirim Email Reset Password',
      name: 'sendPasswordResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email reset password telah dikirim.`
  String get passwordResetEmailHasBeenSent {
    return Intl.message(
      'Email reset password telah dikirim.',
      name: 'passwordResetEmailHasBeenSent',
      desc: '',
      args: [],
    );
  }

  /// `Lupa Password?`
  String get forgotPassword {
    return Intl.message(
      'Lupa Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `atau`
  String get orLogin {
    return Intl.message(
      'atau',
      name: 'orLogin',
      desc: '',
      args: [],
    );
  }

  /// `Masuk dengan Google`
  String get loginWithGoogle {
    return Intl.message(
      'Masuk dengan Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Masuk dengan Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Masuk dengan Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Dengan melakukan login, Anda setuju dengan`
  String get approveLogin {
    return Intl.message(
      'Dengan melakukan login, Anda setuju dengan',
      name: 'approveLogin',
      desc: '',
      args: [],
    );
  }

  /// `syarat & ketentuan Dicoding`
  String get termsAndConditions {
    return Intl.message(
      'syarat & ketentuan Dicoding',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get pleaseEnterSomeText {
    return Intl.message(
      'Please enter some text',
      name: 'pleaseEnterSomeText',
      desc: '',
      args: [],
    );
  }

  /// `SplashScreen`
  String get splashScreenValueKey {
    return Intl.message(
      'SplashScreen',
      name: 'splashScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `LoginScreen`
  String get loginScreenValueKey {
    return Intl.message(
      'LoginScreen',
      name: 'loginScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `RegisterScreen`
  String get registerScreenValueKey {
    return Intl.message(
      'RegisterScreen',
      name: 'registerScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `HomeScreen`
  String get homeScreenValueKey {
    return Intl.message(
      'HomeScreen',
      name: 'homeScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `AddScreen`
  String get addScreenValueKey {
    return Intl.message(
      'AddScreen',
      name: 'addScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `MapScreen`
  String get mapScreenValueKey {
    return Intl.message(
      'MapScreen',
      name: 'mapScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `NavBarScreen`
  String get navbarScreenValueKey {
    return Intl.message(
      'NavBarScreen',
      name: 'navbarScreenValueKey',
      desc: '',
      args: [],
    );
  }

  /// `ForgotPassword`
  String get forgotPasswordScreenValueKey {
    return Intl.message(
      'ForgotPassword',
      name: 'forgotPasswordScreenValueKey',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
