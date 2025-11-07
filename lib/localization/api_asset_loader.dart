import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import 'localization_repository.dart';
import 'merge_helper.dart';

class ApiAssetLoader extends AssetLoader {
  final LocalizationRepository repository;

  ApiAssetLoader({required this.repository});

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    // 1. Load local JSON
    final localData = await rootBundle.loadString(
      'assets/langs/${locale.languageCode}.json',
    );
    final Map<String, dynamic> localJson = json.decode(localData);

    int localVersion = localJson['version'] ?? 0;

    try {
      // 2. Fetch updates from API
      // final apiData = await repository.fetchUpdates(
      //   locale.languageCode,
      //   localVersion,
      // );
      var apiData = {
        "version": 2,
        "updates": {"hello": "Hello!"},
      };
      // API may return {"version": 2, "updates": {"hello":"Hello!"}}
      final updates = apiData['updates'] as Map<String, dynamic>? ?? {};
      final merged = mergeTranslations(localJson, updates);
      merged['version'] = apiData['version'] ?? localVersion;
      return merged;
    } catch (e) {
      // Fallback to local JSON
      return localJson;
    }
  }
}
