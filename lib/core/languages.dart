/// Languages the game ships in. Every ARB file, level name and world name
/// must have each of these (checked by tests).
///
/// Names are written in their own language so a player can always find
/// theirs. Kept in code point order of those names (so by script: Latin,
/// Greek, Cyrillic, Arabic, Devanagari, Bengali, Gurmukhi, Tamil, Telugu,
/// Thai, CJK and Hangul; alphabetical within a script, with accented
/// capitals such as Č after the plain Latin letters); this is the order of
/// the language picker and a test keeps it sorted.
const supportedLanguages = <String, String>{
  'id': 'Bahasa Indonesia',
  'ms': 'Bahasa Melayu',
  'da': 'Dansk',
  'de': 'Deutsch',
  'en': 'English',
  'es': 'Español',
  'fil': 'Filipino',
  'fr': 'Français',
  'it': 'Italiano',
  'sw': 'Kiswahili',
  'hu': 'Magyar',
  'nl': 'Nederlands',
  'nb': 'Norsk bokmål',
  'pl': 'Polski',
  'pt': 'Português',
  'ro': 'Română',
  'fi': 'Suomi',
  'sv': 'Svenska',
  'vi': 'Tiếng Việt',
  'tr': 'Türkçe',
  'cs': 'Čeština',
  'el': 'Ελληνικά',
  'bg': 'Български',
  'ru': 'Русский',
  'uk': 'Українська',
  'ur': 'اردو',
  'ar': 'العربية',
  'fa': 'فارسی',
  'mr': 'मराठी',
  'hi': 'हिन्दी',
  'bn': 'বাংলা',
  'pa': 'ਪੰਜਾਬੀ',
  'ta': 'தமிழ்',
  'te': 'తెలుగు',
  'th': 'ไทย',
  'zh': '中文',
  'ja': '日本語',
  'ko': '한국어',
};

/// Older or alternative codes some devices report, mapped to the code the
/// game uses.
const _languageAliases = <String, String>{
  'in': 'id', // Indonesian (legacy Java code)
  'no': 'nb', // Norwegian
  'tl': 'fil', // Tagalog
};

/// Used when the device language is not supported.
const fallbackLanguage = 'en';

/// The language to use for a device whose preferred languages are
/// [deviceLanguages] (most preferred first).
String resolveLanguage(Iterable<String> deviceLanguages) => deviceLanguages
    .map((code) => _languageAliases[code] ?? code)
    .firstWhere(supportedLanguages.containsKey, orElse: () => fallbackLanguage);
