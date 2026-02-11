// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'छाया जनावर समाचार';

  @override
  String get home => 'गृह';

  @override
  String get notifications => 'सूचनाहरू';

  @override
  String get bookmarks => 'बुकमार्कहरू';

  @override
  String get personalization => 'व्यक्तिगतकरण';

  @override
  String get newsSources => 'समाचार स्रोतहरू';

  @override
  String get newsCategories => 'समाचार वर्गहरू';

  @override
  String get settings => 'सेटिङहरू';

  @override
  String get disclaimer => 'अस्वीकरण';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get language => 'भाषा';

  @override
  String get theme => 'थिम';

  @override
  String get lightMode => 'उज्यालो मोड';

  @override
  String get darkMode => 'अँध्यारो मोड';

  @override
  String get welcomeMessage => 'छाया जनावरमा स्वागत छ';

  @override
  String get openDrawerHint => 'नेभिगेट गर्न ड्रअर खोल्नुहोस्';

  @override
  String get viewNotifications => 'यहाँ आफ्नो सूचनाहरू हेर्नुहोस्';

  @override
  String get customizeBookmarks => 'बुकमार्कहरू अनुकूलन र हेर्नुहोस्';

  @override
  String get viewPersonalizedNews => 'व्यक्तिगत समाचार हेर्नुहोस्';

  @override
  String get arrangeNewsSources =>
      'यहाँ आफ्नो समाचार स्रोतहरू व्यवस्थित गर्नुहोस्';

  @override
  String get changeNewsCategories => 'समाचार वर्गहरू परिवर्तन गर्नुहोस्';

  @override
  String notificationDetail(int index) {
    return 'यो सूचना विवरण $index हो';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours घण्टा अघि';
  }

  @override
  String bookmark(int index) {
    return 'बुकमार्क $index';
  }

  @override
  String get personalizedNewsFeed => 'व्यक्तिगत समाचार फिड';

  @override
  String personalizedArticle(int index) {
    return 'व्यक्तिगत लेख $index';
  }

  @override
  String get personalizedArticleDescription =>
      'यो तपाईंको प्राथमिकताहरूमा आधारित व्यक्तिगत समाचार लेख हो।';

  @override
  String get disclaimerTitle => 'अस्वीकरण';

  @override
  String get disclaimerContent =>
      'यो एप सामान्य उद्देश्यका लागि मात्र समाचार र जानकारी प्रदान गर्दछ। हामी जानकारीलाई सही र अद्यावधिक राख्न प्रयास गर्छौं, हामी जानकारीको पूर्णता, शुद्धता, विश्वसनीयता, वा उपलब्धताको बारेमा कुनै पनि प्रकारको प्रतिनिधित्व वा वारेन्टी गर्दैनौं।';

  @override
  String get disclaimerResponsibility =>
      'प्रयोगकर्ताहरू यस एपमा प्रदान गरिएको सामग्रीमा आधारित निर्णयहरू गर्नु अघि मूल स्रोतहरूबाट जानकारी प्रमाणित गर्न जिम्मेवार छन्।';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get informationCollection => 'जानकारी सङ्कलन';

  @override
  String get informationCollectionContent =>
      'हामी तपाईंले हामीलाई प्रत्यक्ष रूपमा प्रदान गर्नुहुने जानकारी सङ्कलन गर्छौं, जसमा तपाईं खाता सिर्जना गर्दा, आफ्नो प्रोफाइल अद्यावधिक गर्दा, वा हाम्रा सेवाहरू प्रयोग गर्दा समावेश छ।';

  @override
  String get useOfInformation => 'जानकारीको प्रयोग';

  @override
  String get useOfInformationContent =>
      'हामीले सङ्कलन गर्ने जानकारीलाई हाम्रा सेवाहरू प्रदान गर्न, कायम राख्न र सुधार गर्न, तपाईंको अनुभव व्यक्तिगत बनाउन, र तपाईंसँग सञ्चार गर्न प्रयोग गर्छौं।';

  @override
  String get dataSecurity => 'डेटा सुरक्षा';

  @override
  String get dataSecurityContent =>
      'हामी तपाईंको व्यक्तिगत जानकारीलाई अनधिकृत पहुँच, परिवर्तन, वा विनाश विरुद्ध सुरक्षित गर्न उपयुक्त सुरक्षा उपायहरू लागू गर्छौं।';

  @override
  String get technology => 'प्रविधि';

  @override
  String get sports => 'खेलकुद';

  @override
  String get politics => 'राजनीति';

  @override
  String get entertainment => 'मनोरञ्जन';

  @override
  String get business => 'व्यापार';

  @override
  String get health => 'स्वास्थ्य';

  @override
  String get english => 'अंग्रेजी';

  @override
  String get nepali => 'नेपाली';
}
