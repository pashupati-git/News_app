import 'package:hive/hive.dart';

part 'user_preferences.g.dart';

@HiveType(typeId: 0)
class UserPreferences {
  @HiveField(0)
  final bool isDarkMode;

  @HiveField(1)
  final String languageCode;

  @HiveField(2)
  final List<String> selectedCategories;

  @HiveField(3)
  final List<String> enabledSources;

  @HiveField(4)
  final bool notificationsEnabled;

  ///constructor
  const UserPreferences({
    required this.isDarkMode,
    required this.languageCode,
    required this.selectedCategories,
    required this.enabledSources,
    required this.notificationsEnabled,
  });

  factory UserPreferences.defaultPreferences() {
    return const UserPreferences(
      isDarkMode: false,
      languageCode: 'en',
      selectedCategories: [
        'technology',
        'sports',
        'politics',
        'entertainment',
        'business',
        'health',
      ],
      enabledSources: [
        'CNN',
        'BBC',
        'Kantipur',
        'Nepal Television',
        'Rato PAtti',
      ],
      notificationsEnabled: true,
    );
  }

  UserPreferences copyWith({
    bool? isDarkMode,
    String? languageCode,
    List<String>? selectedCategories,
    List<String>? enabledSources,
    bool? notificationsEnabled,
  }) {
    return UserPreferences(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      enabledSources: enabledSources ?? this.enabledSources,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  ///Convert to map for Json serialization or debugging
  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkMode,
      'languageCode': languageCode,
      'selectedCategories': selectedCategories,
      'enabledSources': enabledSources,
      'notificationsEnabled': notificationsEnabled,
    };
  }

  ///Create from map for Json deserialization.
  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    return UserPreferences(
      isDarkMode: map['isDarkMode'] as bool? ?? false,
      languageCode: map['languageCode'] as String? ?? 'en',
      selectedCategories: List<String>.from(map['selectedCategories'] ?? []),
      enabledSources: List<String>.from(map['enabledSources'] ?? []),
      notificationsEnabled: map['notificationsEnabled'] as bool? ?? true,
    );
  }

  @override
  String toString()=>'UserPreferences(${toMap()})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserPreferences &&
        other.isDarkMode == isDarkMode &&
        other.languageCode == languageCode &&
        other.notificationsEnabled == notificationsEnabled;
  }

  @override
  int get hashCode {
    return isDarkMode.hashCode ^
    languageCode.hashCode ^
    notificationsEnabled.hashCode;
  }

}
