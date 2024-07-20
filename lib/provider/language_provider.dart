import '../data/languages.dart';
import '../models/language.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui' as ui;

class LanguageProvider extends StateNotifier<Language> {
  // Retrieve the system locale using PlatformDispatcher
  static final systemLocale = ui.PlatformDispatcher.instance.locale;

  static const defaultLanguage = Language(title: 'English', abbreviation: 'en');

  static Language _getLanguageFromLanguageCode(String code) {
    for(final language in languagesList){
      if(language.abbreviation == code) return language;
    }
    return defaultLanguage;
  }

  LanguageProvider() : super(_getLanguageFromLanguageCode(systemLocale.languageCode));

  void updateLanguage(String languageCode) {
    state = _getLanguageFromLanguageCode(languageCode);
  }

  void changeLanguage(Language language) {
    state = language;
  }
}

final languageProvider =
    StateNotifierProvider<LanguageProvider, Language>((ref) {
  return LanguageProvider();
});
