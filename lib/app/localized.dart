import 'package:block_puzzle/core/localized_text.dart';
import 'package:flutter/widgets.dart';

/// Picks the translation of data-file texts for the current app language.
extension LocalizedTextIn on LocalizedText {
  String localized(BuildContext context) =>
      of(Localizations.localeOf(context).languageCode);
}
