// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Shadow Beast News';

  @override
  String get home => 'Home';

  @override
  String get notifications => 'Notifications';

  @override
  String get bookmarks => 'Bookmarks';

  @override
  String get personalization => 'Personalization';

  @override
  String get newsSources => 'News Sources';

  @override
  String get newsCategories => 'News Categories';

  @override
  String get settings => 'Settings';

  @override
  String get disclaimer => 'Disclaimer';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get welcomeMessage => 'Welcome to Shadow Beast';

  @override
  String get openDrawerHint => 'Open the drawer to navigate';

  @override
  String get viewNotifications => 'View your notifications here';

  @override
  String get customizeBookmarks => 'Customize & View Bookmarks';

  @override
  String get viewPersonalizedNews => 'View Personalized News';

  @override
  String get arrangeNewsSources => 'Arrange your News Sources here';

  @override
  String get changeNewsCategories => 'Change News Categories';

  @override
  String notificationDetail(int index) {
    return 'This is notification detail $index';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}h ago';
  }

  @override
  String bookmark(int index) {
    return 'Bookmark $index';
  }

  @override
  String get personalizedNewsFeed => 'Personalized News Feed';

  @override
  String personalizedArticle(int index) {
    return 'Personalized Article $index';
  }

  @override
  String get personalizedArticleDescription =>
      'This is a personalized news article based on your preferences.';

  @override
  String get disclaimerTitle => 'Disclaimer';

  @override
  String get disclaimerContent =>
      'This app provides news and information for general purposes only. While we strive to keep the information accurate and up-to-date, we make no representations or warranties of any kind about the completeness, accuracy, reliability, or availability of the information.';

  @override
  String get disclaimerResponsibility =>
      'Users are responsible for verifying information from original sources before making decisions based on content provided in this app.';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get informationCollection => 'Information Collection';

  @override
  String get informationCollectionContent =>
      'We collect information that you provide directly to us, including when you create an account, update your profile, or use our services.';

  @override
  String get useOfInformation => 'Use of Information';

  @override
  String get useOfInformationContent =>
      'We use the information we collect to provide, maintain, and improve our services, personalize your experience, and communicate with you.';

  @override
  String get dataSecurity => 'Data Security';

  @override
  String get dataSecurityContent =>
      'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, or destruction.';

  @override
  String get technology => 'Technology';

  @override
  String get sports => 'Sports';

  @override
  String get politics => 'Politics';

  @override
  String get entertainment => 'Entertainment';

  @override
  String get business => 'Business';

  @override
  String get health => 'Health';

  @override
  String get english => 'English';

  @override
  String get nepali => 'Nepali';
}
