import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }

  String get currentLanguageCode => _currentLocale.languageCode;

  String get currentLanguageName {
    switch (_currentLocale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return 'English';
    }
  }
}
