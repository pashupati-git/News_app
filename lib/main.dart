import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/presentation/provider/cache_provider.dart';
import 'package:news_app/presentation/screens/home_screen.dart';
import 'package:news_app/presentation/viewmodels/preferences_viewmodel.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final cacheService = container.read(cacheServiceProvider);
  await cacheService.initialize();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///watch theme mode from prefernces
    final isDarkMode = ref.watch(themeModeProvider);

    ///watch language code from preferences
    ///App rebuilds automatically when language changes
    final languageCode = ref.watch(languageProvider);
    return MaterialApp(
      home: HomeScreen(),
      title: 'News App',
      debugShowCheckedModeBanner: false,

      //theme configuration
      //Switches between light and dark based on user preference
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme:AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      //Localization configuration
      //Supports English (en) and Nepali(ne)
      locale:Locale(languageCode),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ne'),
      ],
    );
  }
}
