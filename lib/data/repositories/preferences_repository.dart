import 'package:news_app/data/model/user_preferences.dart';
import 'package:news_app/data/services/cache_services.dart';

///Repository pattern for user preferences
///Abstracts data sources (cache) from the rest of the app
///This allows easy switching between different storage solutions
///Repository sits between ViewModel and Data Sources

class PreferencesRepository {
  final CacheServices _cacheService;
  PreferencesRepository(this._cacheService);

  //Get user preference
  //First checks cache , falls back to defaults if not found
  UserPreferences getPreferences() {
    return _cacheService.getUserPreferences();
  }

  //Save User preferences
  //Returns true if save was successful
  Future<bool> savePreferences(UserPreferences preferences) async {
    try {
      await _cacheService.saveUserPreferences(preferences);
      return true;
    } catch (e) {
      print('Error saving preferences:$e');
      return false;
    }
  }

  //Update theme mode only
  //More efficient than updating entire preference object
  Future<bool> updateThemeMode(bool isDarkMode) async {
    try {
      final prefs = getPreferences();
      final updated = prefs.copyWith(isDarkMode: isDarkMode);
      await savePreferences(updated);
      await _cacheService.setIsDarkMode(isDarkMode);
      return true;
    } catch (e) {
      print('Error updating theme:$e');
      return false;
    }
  }

  //Update language code only
  Future<bool> updateLanguage(String languageCode) async {
    try {
      final prefs = getPreferences();
      final updated = prefs.copyWith(languageCode: languageCode);
      await savePreferences(updated);
      await _cacheService.setLanguageCode(languageCode);
      return true;
    } catch (e) {
      print('Error updating language:$e');
      return false;
    }
  }

  //Toggle a news source on/off
  Future<bool> toggleSources(String source) async {
    try {
      final prefs = getPreferences();
      final sources = List<String>.from(prefs.enabledSources);
      if (sources.contains(source)) {
        sources.remove(source);
      } else {
        sources.add(source);
      }

      final updated = prefs.copyWith(enabledSources: sources);
      return await savePreferences(updated);
    } catch (e) {
      print('Error toggling sources:$e');
      return false;
    }
  }


  //Reorder news sources
  //Update the order in which sources appear in UI
  Future<bool> reorderSources(List<String> newOrder) async{
    try{
      final prefs=getPreferences();
      final updated=prefs.copyWith(enabledSources: newOrder);
      return await savePreferences(updated);
    }catch(e){
      print('Error reordering sources:$e');
      return false;
    }
  }

  //Toggle notification on/off
  Future<bool> toogleNotifications(bool enabled) async{
    try{
      final prefs=getPreferences();
      final updated=prefs.copyWith(notificationsEnabled:enabled);
      return await savePreferences(updated);
    }catch(e){
      print('Error toggling notifications:$e');
      return false;
    }
  }

  //Reset all preferences to defaults
  Future<bool> resetToDefaults() async{
    try{
      final defaults=UserPreferences.defaultPreferences();
      return await savePreferences(defaults);
    }catch(e){
      print('Error resetting preferences:$e');
      return false;
    }
  }

  ///Stream of preferences changes (for reactive UI)
  ///Note: Hive supports watching boxes for changes
  Stream<UserPreferences> watchPreferences(){
    //this would use Hive's watch() method in production
    //For now,returning a simple stream
    return Stream.value(getPreferences());
  }
}
