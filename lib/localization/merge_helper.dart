Map<String, dynamic> mergeTranslations(
  Map<String, dynamic> local,
  Map<String, dynamic> updates,
) {
  final merged = Map<String, dynamic>.from(local);
  updates.forEach((key, value) {
    merged[key] = value;
  });
  return merged;
}
