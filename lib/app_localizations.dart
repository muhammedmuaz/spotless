import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This [ApplicationLocale] class is used for application local allocation and declaration

class ApplicationLocale {
  factory ApplicationLocale() {
    return _applicationLocale;
  }

  ApplicationLocale._internal();

  static final ApplicationLocale _applicationLocale =
      ApplicationLocale._internal();

  /// [supportedLanguages] list is user for declaration of languages

  final List<String> supportedLanguages = <String>["English", "Malayalam"];

  /// [supportedLanguagesCodes] list is user for declaration of language codes

  final List<String> supportedLanguagesCodes = <String>["en", "ml"];

  /// returns the list of supported Locales

  Iterable<Locale> supportedLocales() => supportedLanguagesCodes
      .map<Locale>((String language) => Locale(language, ""));

  /// function to be invoked when changing the language

  late LocaleChangeCallback onLocaleChanged;
}

ApplicationLocale applicationLocale = ApplicationLocale();

typedef LocaleChangeCallback = void Function(Locale locale);

///This [AppLocalizationsDelegate] class is used for support,load and translations checking

class AppLocalizationsDelegate extends LocalizationsDelegate<AppTranslations> {
  const AppLocalizationsDelegate({required this.newLocale});
  final Locale newLocale;

  @override
  bool isSupported(Locale locale) {
    // return ['en', 'ar'].contains(locale.languageCode);
    return applicationLocale.supportedLanguagesCodes
        .contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(newLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return false;
  }
}

/// This [AppTranslations] is used for fetch translations from [assets\i18n\en.json] or [assets\i18n\ml.json]
/// and load to the page according to the user input

class AppTranslations {
  AppTranslations(this.locale) {
    this.locale = locale;
    _localisedValues = null;
  }
  Locale locale;
  static Map<dynamic, dynamic>? _localisedValues;
  static String? translationsDictionary;

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  /// This [loadCurrentLocaleDictionary] fun is local dictionary , that is translation written
  /// ,That is the local dictionary inside the [assets/i18n] and the file is written in json format

  static loadCurrentLocaleDictionary(Locale locale) async {
    translationsDictionary =
        await rootBundle.loadString("assets/i18n/${locale.languageCode}.json");
    _localisedValues = json.decode(translationsDictionary!);
    return;
  }

  /// This [load] fun is used to Load  current [local] to local dictionary
  /// It will load the [AppTranslations] in [assets/i18n]

  static Future<AppTranslations> load(Locale locale) async {
    final AppTranslations appTranslations = AppTranslations(locale);
    if (_localisedValues == null) await loadCurrentLocaleDictionary(locale);
    return appTranslations;
  }

  String get currentLanguage => locale.languageCode;

  /// This [text] fun is used to get the transalated value comming from json file

  String text(String page, String key) {
    String _translation;
    try {
      _translation = _localisedValues![page][key] ?? "$key";
    } catch (e) {
      _translation = '$key';
    }
    return _translation;
  }
}
