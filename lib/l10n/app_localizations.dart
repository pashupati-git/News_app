import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ne.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ne'),
  ];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Shadow Beast News'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// No description provided for @personalization.
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get personalization;

  /// No description provided for @newsSources.
  ///
  /// In en, this message translates to:
  /// **'News Sources'**
  String get newsSources;

  /// No description provided for @newsCategories.
  ///
  /// In en, this message translates to:
  /// **'News Categories'**
  String get newsCategories;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimer;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Shadow Beast'**
  String get welcomeMessage;

  /// No description provided for @openDrawerHint.
  ///
  /// In en, this message translates to:
  /// **'Open the drawer to navigate'**
  String get openDrawerHint;

  /// No description provided for @viewNotifications.
  ///
  /// In en, this message translates to:
  /// **'View your notifications here'**
  String get viewNotifications;

  /// No description provided for @customizeBookmarks.
  ///
  /// In en, this message translates to:
  /// **'Customize & View Bookmarks'**
  String get customizeBookmarks;

  /// No description provided for @viewPersonalizedNews.
  ///
  /// In en, this message translates to:
  /// **'View Personalized News'**
  String get viewPersonalizedNews;

  /// No description provided for @arrangeNewsSources.
  ///
  /// In en, this message translates to:
  /// **'Arrange your News Sources here'**
  String get arrangeNewsSources;

  /// No description provided for @changeNewsCategories.
  ///
  /// In en, this message translates to:
  /// **'Change News Categories'**
  String get changeNewsCategories;

  /// No description provided for @notificationDetail.
  ///
  /// In en, this message translates to:
  /// **'This is notification detail {index}'**
  String notificationDetail(int index);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String hoursAgo(int hours);

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark {index}'**
  String bookmark(int index);

  /// No description provided for @personalizedNewsFeed.
  ///
  /// In en, this message translates to:
  /// **'Personalized News Feed'**
  String get personalizedNewsFeed;

  /// No description provided for @personalizedArticle.
  ///
  /// In en, this message translates to:
  /// **'Personalized Article {index}'**
  String personalizedArticle(int index);

  /// No description provided for @personalizedArticleDescription.
  ///
  /// In en, this message translates to:
  /// **'This is a personalized news article based on your preferences.'**
  String get personalizedArticleDescription;

  /// No description provided for @disclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimerTitle;

  /// No description provided for @disclaimerContent.
  ///
  /// In en, this message translates to:
  /// **'This app provides news and information for general purposes only. While we strive to keep the information accurate and up-to-date, we make no representations or warranties of any kind about the completeness, accuracy, reliability, or availability of the information.'**
  String get disclaimerContent;

  /// No description provided for @disclaimerResponsibility.
  ///
  /// In en, this message translates to:
  /// **'Users are responsible for verifying information from original sources before making decisions based on content provided in this app.'**
  String get disclaimerResponsibility;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @informationCollection.
  ///
  /// In en, this message translates to:
  /// **'Information Collection'**
  String get informationCollection;

  /// No description provided for @informationCollectionContent.
  ///
  /// In en, this message translates to:
  /// **'We collect information that you provide directly to us, including when you create an account, update your profile, or use our services.'**
  String get informationCollectionContent;

  /// No description provided for @useOfInformation.
  ///
  /// In en, this message translates to:
  /// **'Use of Information'**
  String get useOfInformation;

  /// No description provided for @useOfInformationContent.
  ///
  /// In en, this message translates to:
  /// **'We use the information we collect to provide, maintain, and improve our services, personalize your experience, and communicate with you.'**
  String get useOfInformationContent;

  /// No description provided for @dataSecurity.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get dataSecurity;

  /// No description provided for @dataSecurityContent.
  ///
  /// In en, this message translates to:
  /// **'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, or destruction.'**
  String get dataSecurityContent;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @politics.
  ///
  /// In en, this message translates to:
  /// **'Politics'**
  String get politics;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @nepali.
  ///
  /// In en, this message translates to:
  /// **'Nepali'**
  String get nepali;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ne':
      return AppLocalizationsNe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
