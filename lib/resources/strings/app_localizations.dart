import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import 'string_ids.dart';
import 'strings_en.dart';
import 'strings_uk.dart';

class AppLocalizations {

  final Locale _locale;

  AppLocalizations(this._locale);

  static const Map<String, Map<String, String>> _localizedStrings = {
    'en': english,
    'uk': ukrainian,
  };

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  ///Strings

  String get basketTitle => _localizedStrings[_locale.languageCode][basketTitleId];
  String get locationTitle => _localizedStrings[_locale.languageCode][locationTitleId];
  String get ordersTitle => _localizedStrings[_locale.languageCode][ordersTitleId];
  String get profileTitle => _localizedStrings[_locale.languageCode][profileTitleId];
  String get shopTitle => _localizedStrings[_locale.languageCode][shopTitleId];

  ///Profile route
  String get stepsToFreeCoffee => _localizedStrings[_locale.languageCode][stepsToFreeCoffeeId];
  String get daily => _localizedStrings[_locale.languageCode][dailyId];
  String get random => _localizedStrings[_locale.languageCode][randomId];
  String get boss => _localizedStrings[_locale.languageCode][bossId];
  String get achievements => _localizedStrings[_locale.languageCode][achievementsId];
  String get exp => _localizedStrings[_locale.languageCode][expId];
  String get destroyedCroissants => _localizedStrings[_locale.languageCode][destroyedCroissantsId];
  String get drankLattes => _localizedStrings[_locale.languageCode][drankLattesId];
  String get drankAmericanos => _localizedStrings[_locale.languageCode][drankAmericanosId];
  String get joinTheGame => _localizedStrings[_locale.languageCode][joinTheGameId];
  String get loyaltySystem => _localizedStrings[_locale.languageCode][loyaltySystemId];
  String get giftCards => _localizedStrings[_locale.languageCode][giftCardsId];
  String get bonuses => _localizedStrings[_locale.languageCode][bonusesId];
  String get setting => _localizedStrings[_locale.languageCode][settingId];
  String get paymentMethods => _localizedStrings[_locale.languageCode][paymentMethodsId];
  String get signOut => _localizedStrings[_locale.languageCode][signOutId];
  String get loadingProfileFailed => _localizedStrings[_locale.languageCode][loadingProfileFailedId];
  String get noInternetConnection => _localizedStrings[_locale.languageCode][noInternetConnectionId];
  String get retry => _localizedStrings[_locale.languageCode][retryId];

  /// Product Details Route
  String get productDetailsTitle => _localizedStrings[_locale.languageCode][productDetailsTitleId];
  String get addToBasketButtonTitle => _localizedStrings[_locale.languageCode][addToBasketButtonTitleId];
  String get productName => _localizedStrings[_locale.languageCode][productNameId];
  String get productPrice => _localizedStrings[_locale.languageCode][productPriceId];
  String get productDescription => _localizedStrings[_locale.languageCode][productDescriptionId];
  String get sizeOverline => _localizedStrings[_locale.languageCode][sizeOverlineId];
  String get chooseBeansOverline => _localizedStrings[_locale.languageCode][chooseBeansOverlineId];
  String get chooseMilkOverline => _localizedStrings[_locale.languageCode][chooseMilkOverlineId];
  String get chooseExtrasOverline => _localizedStrings[_locale.languageCode][chooseExtrasOverlineId];
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