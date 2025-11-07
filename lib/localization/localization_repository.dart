import 'dart:convert';

import 'package:http/http.dart' as http;

class LocalizationRepository {
  final String baseUrl;

  LocalizationRepository({required this.baseUrl});

  /// Fetch updates from API given the local version
  Future<Map<String, dynamic>> fetchUpdates(
    String langCode,
    int currentVersion,
  ) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$langCode.json?version=$currentVersion'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      throw Exception('Failed to fetch localization updates');
    }
  }
}
