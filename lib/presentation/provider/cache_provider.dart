
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/services/cache_services.dart';

///Provider for CacheServices singleton instance
///This ensures only one cache service exists throughout the app
///Using provider (not NotifierProvider) because Cacheservices is not state.


final cacheServiceProvider=Provider<CacheServices>((ref){
  //Create and return cache service instance
  return CacheServices();
});

///Provider for cache initialization
///Returns a future that completes when cache is ready
///Used in main.dart to ensure cache is initialized before app starts

final cacheInitializationProvider=FutureProvider<bool>((ref)async{
  final cacheService=ref.read(cacheServiceProvider);
  return await cacheService.initialize();
});