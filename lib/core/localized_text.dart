import 'package:meta/meta.dart';

/// A display text stored in data files (level and world names) with one
/// translation per language code. Pure Dart so domain models can hold it.
@immutable
final class LocalizedText {
  const LocalizedText(this.values);

  /// Reads either a plain string (used for every language) or a
  /// `{"tr": "...", "en": "..."}` map.
  factory LocalizedText.fromJson(Object? json) => switch (json) {
    final String text => LocalizedText({fallbackLanguage: text}),
    final Map<Object?, Object?> map => LocalizedText(
      map.map((key, value) => MapEntry(key! as String, value! as String)),
    ),
    _ => throw FormatException('Invalid localized text: $json'),
  };

  /// Used when a language has no translation.
  static const fallbackLanguage = 'en';

  /// Language code → text.
  final Map<String, String> values;

  /// The text in [languageCode], falling back to English, then to any.
  String of(String languageCode) =>
      values[languageCode] ??
      values[fallbackLanguage] ??
      (values.isEmpty ? '' : values.values.first);

  @override
  bool operator ==(Object other) =>
      other is LocalizedText &&
      other.values.length == values.length &&
      other.values.entries.every((e) => values[e.key] == e.value);

  @override
  int get hashCode => Object.hashAllUnordered(
    values.entries.map((e) => Object.hash(e.key, e.value)),
  );
}
