import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyappsdicoding/model/list_story.dart';

abstract class StoryRepository {
  Future<List<ListStory>> getStories(int page, int size);

  Future<void> addStory(List<int> bytes, String fileName, String description,
      double lat, double lon);

  Future<ListStory> getStory(String id);
}

class StoryRepositoryImpl implements StoryRepository {
  final Client client;

  StoryRepositoryImpl({required this.client});

  @override
  Future<List<ListStory>> getStories(int page, int size) async {
    final url =
        'https://story-api.dicoding.dev/v1/stories?location=1&page=$page&size=$size';
    final response = await _getRequest(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final stories = data['listStory'] as List;
      return stories.map((story) => ListStory.fromJson(story)).toList();
    } else {
      final errorMessage = _getErrorMessage(response.statusCode);
      throw Exception(errorMessage);
    }
  }

  @override
  Future<void> addStory(List<int> bytes, String fileName, String description,
      double lat, double lon) async {
    const url = 'https://story-api.dicoding.dev/v1/stories';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'description': description,
      'lat': lat.toString(),
      'lon': lon.toString(),
    };
    final multiPart =
        MultipartFile.fromBytes('photo', bytes, filename: fileName);
    final request = MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll(headers)
      ..files.add(multiPart)
      ..fields.addAll(body);
    final sendRequest = await request.send();
    final response = await http.Response.fromStream(sendRequest);

    if (response.statusCode == 201) {
      return;
    } else {
      final errorMessage = _getErrorMessage(response.statusCode);
      throw Exception(errorMessage);
    }
  }

  @override
  Future<ListStory> getStory(String id) async {
    final url = 'https://story-api.dicoding.dev/v1/stories/$id';
    final response = await _getRequest(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ListStory.fromJson(data['story']);
    } else {
      final errorMessage = _getErrorMessage(response.statusCode);
      throw Exception(errorMessage);
    }
  }

  Future<Response> _getRequest(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await client.get(Uri.parse(url), headers: headers);
    return response;
  }

  String _getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Permintaan tidak valid. Silakan coba lagi.';
      case 401:
        return 'Tidak diizinkan. Harap masuk terlebih dahulu.';
      case 403:
        return 'Dilarang. Anda tidak memiliki izin untuk akses ini.';
      case 404:
        return 'Tidak ditemukan. Data yang diminta tidak tersedia.';
      case 500:
        return 'Kesalahan server internal. Silakan coba lagi nanti.';
      default:
        return 'Terjadi kesalahan. Silakan coba lagi.';
    }
  }
}
