import 'package:flutter/material.dart';


import 'l10n/all_locales.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!AllLocales.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
