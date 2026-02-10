import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/data/model/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  //Hive Box names for different data types
  static const String _preferencesBoxName = 'user_preferences';
  static const String _newsBoxName = 'cached_news';
  static const String _bookmarksBoxName = 'bookmarks';

  //Hive Boxes-opened during initialization
  late Box<UserPreferences> _preferencesBox;
  late Box _newsBox;
  late Box _bookmarksBox;

  //SharedPreferences instance for simple values
  late SharedPreferences _prefs;

  Future<bool> initialize() async {
    try {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(UserPreferencesAdapter());
      }
      _preferencesBox = await Hive.openBox(_preferencesBoxName);
      _newsBox = await Hive.openBox(_newsBoxName);
      _bookmarksBox = await Hive.openBox(_bookmarksBoxName);

      _prefs = await SharedPreferences.getInstance();
      return true;
    } catch (e) {
      print('Cache initialization problem:$e');
      return false;
    }
  }

  //===================user preferences============================
  ///Get user preferences from cache
  UserPreferences getUserPreferences() {
    final prefs = _preferencesBox.get('current');
    return prefs ?? UserPreferences.defaultPreferences();
  }

  Future<void> saveUserPreferences(UserPreferences preferences) async {
    await _preferencesBox.put('current', preferences);
  }

  ///Get theme mode preferences
  bool getIsDarkMode() {
    return _prefs.getBool('is_dark_mode') ?? false;
  }

  Future<void> setIsDarkMode(bool isDark) async {
    await _prefs.setBool('is_dark_mode', isDark);
  }

  String getLanguageCode() {
    return _prefs.getString('language_code') ?? 'en';
  }

  Future<void> setLanguageCode(String code) async {
    await _prefs.setString('language_code', code);
  }

  //==================News Caching=====================
  ///Cache news articles for offline access
  Future<void> cacheNews(String key, Map<String, dynamic> newsData) async {
    //Add timestamp for cache invalidation
    newsData['cachedAt'] = DateTime.now().toIso8601String();
    await _newsBox.put(key, newsData);
  }

  ///Get cached news articles
  Map<String, dynamic>? getCachedNews(
    String key, {
    Duration maxAge = const Duration(hours: 1),
  }) {
    final data = _newsBox.get(key) as Map<String, dynamic>?;
    if (data == null) return null;

    //Check if cache is still valid
    final cachedAt = DateTime.parse(data['cachedAt'] as String);
    final age = DateTime.now().difference(cachedAt);
    if (age > maxAge) {
      //Cache is stale,remove it
      _newsBox.delete(key);
      return null;
    }
    return data;
  }

  ///clear all cached news
  Future<void> clearNewsCache() async {
    await _newsBox.clear();
  }

  //==============BOOKMARKS=======================================
  List<String> getBookmarks() {
    return List<String>.from(_bookmarksBox.get('articles', defaultValue: []));
  }

  ///Add article to booksmarks
  Future<void> addBookmark(String articleId) async {
    final bookmarks = getBookmarks();
    if (!bookmarks.contains(articleId)) {
      bookmarks.add(articleId);
      await _bookmarksBox.put('articles', bookmarks);
    }
  }

  ///Remove article from bookmarks
  Future<void> removeBookmark(String articleId) async {
    final bookmarks = getBookmarks();
    bookmarks.remove(articleId);
    await _bookmarksBox.put('articles', bookmarks);
  }

  ///Check if article is bookmarked
  bool isBookmarked(String articleId) {
    return getBookmarks().contains(articleId);
  }

  //======================Utility methods======================
  ///Clear all cache data
  Future<void> clearAll() async{
    await _preferencesBox.clear();
    await _newsBox.clear();
    await _bookmarksBox.clear();
    await _prefs.clear();
  }
  //Get cache statistics for debugging
  Map<String,int> getCacheStats(){
    return{
      'preferences':_preferencesBox.length,
      'news':_newsBox.length,
      'bookmarks':getBookmarks().length,
    };
  }
  ///Dispose and close all boxes
  Future<void> dispose() async{
    await _preferencesBox.close();
    await _newsBox.close();
    await _bookmarksBox.close();
  }
}
