/// Languages the game ships in. Every ARB file, level name and world name
/// must have each of these (checked by tests).
///
/// Names are written in their own language so a player can always find
/// theirs. Kept in alphabetical order of those names (Latin script first,
/// then Greek, Cyrillic, Arabic, Devanagari, CJK and Hangul); this is the
/// order of the language picker and a test keeps it sorted.
const supportedLanguages = <String, String>{
  'de': 'Deutsch',
  'en': 'English',
  'es': 'Español',
  'fr': 'Français',
  'it': 'Italiano',
  'pl': 'Polski',
  'pt': 'Português',
  'tr': 'Türkçe',
  'el': 'Ελληνικά',
  'bg': 'Български',
  'ru': 'Русский',
  'ar': 'العربية',
  'hi': 'हिन्दी',
  'zh': '中文',
  'ja': '日本語',
  'ko': '한국어',
};

/// Used when the device language is not supported.
const fallbackLanguage = 'en';

/// The language to use for a device whose preferred languages are
/// [deviceLanguages] (most preferred first).
String resolveLanguage(Iterable<String> deviceLanguages) => deviceLanguages
    .firstWhere(supportedLanguages.containsKey, orElse: () => fallbackLanguage);
