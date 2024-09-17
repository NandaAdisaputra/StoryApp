class CustomExceptionsHelper {
  static Exception emptyInputException({required String message}) {
    return Exception(message);
  }

  static Exception weakPasswordException(
      {String message = 'Password must be at least 8 characters long'}) {
    return Exception(message);
  }

  static Exception invalidEmailFormatException(
      {String message = 'Invalid email format'}) {
    return Exception(message);
  }

  static Exception invalidUsernameFormatException(
      {String message = 'Invalid username format'}) {
    return Exception(message);
  }
}
class NoInternetError implements Exception {
  final String message;

  NoInternetError(this.message);
}

class ServerException implements Exception {
  final int statusCode;

  ServerException(this.statusCode);
}

class ClientException implements Exception {}