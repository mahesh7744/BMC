import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'mr', 'kn'].contains(locale.languageCode)) return;

    _locale = locale;
    notifyListeners(); // यामुळे अ‍ॅपच्या सर्व स्क्रीनवर बदल होईल.
  }

  void clearLocale() {
    _locale = Locale('en'); // डिफॉल्ट भाषा सेट करणे
    notifyListeners();
  }
}
