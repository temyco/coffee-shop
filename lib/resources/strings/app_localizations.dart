import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import 'string_ids.dart';
import 'strings_en.dart';
import 'strings_uk.dart';

class AppLocalizations {

  final Locale _locale;

  AppLocalizations(this._locale);

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': english,
    'uk': ukrainian,
  };

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  ///Strings

  String get basketTitle => _localizedValues[_locale.languageCode][basketTitleId];
  String get locationTitle => _localizedValues[_locale.languageCode][locationTitleId];
  String get ordersTitle => _localizedValues[_locale.languageCode][ordersTitleId];
  String get profileTitle => _localizedValues[_locale.languageCode][profileTitleId];
  String get shopTitle => _localizedValues[_locale.languageCode][shopTitleId];

  ///Profile route
  String get stepsToFreeCoffee => _localizedValues[_locale.languageCode][stepsToFreeCoffeeId];
  String get daily => _localizedValues[_locale.languageCode][dailyId];
  String get random => _localizedValues[_locale.languageCode][randomId];
  String get boss => _localizedValues[_locale.languageCode][bossId];
  String get achievements => _localizedValues[_locale.languageCode][achievementsId];
  String get exp => _localizedValues[_locale.languageCode][expId];
  String get destroyedCroissants => _localizedValues[_locale.languageCode][destroyedCroissantsId];
  String get drankLattes => _localizedValues[_locale.languageCode][drankLattesId];
  String get drankAmericanos => _localizedValues[_locale.languageCode][drankAmericanosId];
  String get joinTheGame => _localizedValues[_locale.languageCode][joinTheGameId];
  String get loyaltySystem => _localizedValues[_locale.languageCode][loyaltySystemId];
  String get giftCards => _localizedValues[_locale.languageCode][giftCardsId];
  String get bonuses => _localizedValues[_locale.languageCode][bonusesId];
  String get setting => _localizedValues[_locale.languageCode][settingId];
  String get paymentMethods => _localizedValues[_locale.languageCode][paymentMethodsId];
  String get signOut => _localizedValues[_locale.languageCode][signOutId];
  String get loadingProfileFailed => _localizedValues[_locale.languageCode][loadingProfileFailedId];
  String get noInternetConnection => _localizedValues[_locale.languageCode][noInternetConnectionId];
  String get retry => _localizedValues[_locale.languageCode][retryId];
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'uk'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}