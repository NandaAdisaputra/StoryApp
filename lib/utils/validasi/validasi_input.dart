
import 'package:storyappsdicoding/utils/errors_helper/exceptions.dart';

class CustomValidateHelper {
  void validateRegistrationInputs(String name, String email, String password) {
    if (name.isEmpty) {
      throw CustomExceptionsHelper.emptyInputException(
          message: 'Name cannot be empty');
    }

    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(name)) {
      throw CustomExceptionsHelper.invalidUsernameFormatException(
          message: 'Invalid username format');
    }

    if (email.isEmpty || password.isEmpty) {
      throw CustomExceptionsHelper.emptyInputException(
          message: 'Email and password cannot be empty');
    }

    if (password.length < 6) {
      throw CustomExceptionsHelper.weakPasswordException(
          message: 'Password must be at least 6 characters long');
    }

    if (!isValidEmail(email)) {
      throw CustomExceptionsHelper.invalidEmailFormatException(
          message: 'Invalid email format');
    }
  }
  bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    return RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
