/// Languages the game ships in. Every ARB file, level name and world name
/// must have each of these (checked by tests).
///
/// Order is the order shown in the language picker. Names are written in
/// their own language so a player can always find theirs.
const supportedLanguages = <String, String>{
  'tr': 'Türkçe',
  'en': 'English',
  'de': 'Deutsch',
  'fr': 'Français',
  'es': 'Español',
  'pt': 'Português',
  'it': 'Italiano',
  'ru': 'Русский',
  'ar': 'العربية',
  'ja': '日本語',
  'zh': '中文',
};

/// Used when the device language is not supported.
const fallbackLanguage = 'en';

/// The language to use for a device whose preferred languages are
/// [deviceLanguages] (most preferred first).
String resolveLanguage(Iterable<String> deviceLanguages) => deviceLanguages
    .firstWhere(supportedLanguages.containsKey, orElse: () => fallbackLanguage);
