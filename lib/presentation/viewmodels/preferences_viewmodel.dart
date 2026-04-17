import 'package:news_app/data/model/user_preferences.dart';
import 'package:news_app/presentation/provider/cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/preferences_repository.dart';

class PreferencesViewModel extends Notifier<UserPreferences> {
  late PreferencesRepository _repository;

  @override
  UserPreferences build() {
    final cacheServices = ref.read(cacheServiceProvider);
    _repository = PreferencesRepository(cacheServices);

    return _repository.getPreferences();
  }

  //toggle between dark and light theme
  //Updates state and persists to cache
  Future<void> toggleTheme(bool isDarkMode) async {
    state = state.copyWith(isDarkMode: isDarkMode);

    //Persist to storage
    final success = await _repository.updateThemeMode(isDarkMode);

    //Revert if save failed
    if (!success) {
      state = state.copyWith(isDarkMode: !isDarkMode);
    }
  }

  //Change app language
  Future<void> changeLanguage(String languageCode) async {
    state = state.copyWith(languageCode: languageCode);
    await _repository.updateLanguage(languageCode);
  }

  //Toggle a news category selection
  //Used in News Categories page
  Future<void> toggleCategory(String category) async {
    final categories = List<String>.from(state.selectedCategories);

    if (categories.contains(category)) {
      categories.remove(category);
    } else {
      categories.add(category);
    }
    state = state.copyWith(selectedCategories: categories);
    await _repository.toggleCategory(category);
  }

  //Toggle a news source on/off
  Future<void> toggleSource(String source) async {
    final sources = List<String>.from(state.enabledSources);
    if (sources.contains(source)) {
      sources.remove(source);
    } else {
      sources.add(source);
    }
    state = state.copyWith(enabledSources: sources);
    await _repository.toggleSources(source);
  }

  //reorder news sources
  Future<void> reorderSources(int oldIndex, int newIndex) async {
    final sources = List<String>.from(state.enabledSources);

    //Adjust index if moving down
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    //Perform the reorder
    final item = sources.removeAt(oldIndex);
    sources.insert(newIndex, item);

    state = state.copyWith(enabledSources: sources);
    await _repository.reorderSources(sources);
  }

  ///Toggle notifications on/off
  Future<void> toggleNotifications(bool enabled) async {
    state = state.copyWith(notificationsEnabled: enabled);
    await _repository.toogleNotifications(enabled);
  }

  ///Reset all preferences to defaults
  ///Useful for troubleshooting or user requests
  Future<void> resetTodefaults() async {
    final defaults = UserPreferences.defaultPreferences();
    state = defaults;
    await _repository.resetToDefaults();
  }

  ///check if category is selected
  bool isCAtegorySelected(String category) {
    return state.selectedCategories.contains(category);
  }

  ///check if source is enabled
  bool isSourceEnabled(String source) {
    return state.enabledSources.contains(source);
  }
}

///Provider for preferencesViewModel
final preferencesProvider =
    NotifierProvider<PreferencesViewModel, UserPreferences>(
      () => PreferencesViewModel(),
    );

///Derived provider for theme mode
///Listens to preferences and extracts just the theme mode
final themeModeProvider = Provider<bool>((ref) {
  return ref.watch(preferencesProvider).isDarkMode;
});

///derived provider for language code
final languageProvider=Provider<String>((ref){
  return ref.watch(preferencesProvider).languageCode;
});

///Derived provider for selected categories
final selectedCategoriesProvider=Provider<List<String>>((ref){
  return ref.watch(preferencesProvider).selectedCategories;
});

///derived provider for enabled sources
final enabledSourcesProvider=Provider<List<String>>((ref){
  return ref.watch(preferencesProvider).enabledSources;
});