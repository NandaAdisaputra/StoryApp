import 'dart:convert';
import 'package:http/http.dart';
import 'package:storyappsdicoding/data/base/endpoint.dart';

abstract class AuthRepository {
  Future<String?> login(String email, String password);
  Future<void> register(String name, String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final Client client;
  AuthRepositoryImpl({required this.client});

  @override
  Future<String?> login(String email, String password) async {
    final url = postLogin.endPointLogin;
    final body = {'email': email, 'password': password};

    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['loginResult']['token'];
    } else {
      _handleError(response);
      return null;
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    final url = postRegister.endPointRegister;
    final body = {'name': name, 'email': email, 'password': password};

    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 201) {
      return;
    } else {
      _handleError(response);
    }
  }

  void _handleError(Response response) {
    final data = json.decode(response.body);
    final errorMessage = data['message'] ?? 'Gagal melakukan operasi, mohon coba lagi';
    switch (response.statusCode) {
      case 400:
        throw 'Permintaan tidak valid: $errorMessage';
      case 401:
        throw 'Tidak diizinkan: $errorMessage';
      case 403:
        throw 'Akses ditolak: $errorMessage';
      case 404:
        throw 'Tidak ditemukan: $errorMessage';
      case 500:
        throw 'Kesalahan Server Internal: $errorMessage';
      default:
        throw 'Terjadi kesalahan (${response.statusCode}): $errorMessage';
    }
  }
}
