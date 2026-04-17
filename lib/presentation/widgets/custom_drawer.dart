import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/presentation/screens/bookmarks_screen.dart';
import 'package:news_app/presentation/screens/disclaimer_screen.dart';
import 'package:news_app/presentation/screens/news_categories_screen.dart';
import 'package:news_app/presentation/screens/news_sources_screen.dart';
import 'package:news_app/presentation/screens/notifications_screen.dart';
import 'package:news_app/presentation/screens/personalization_screen.dart';
import 'package:news_app/presentation/screens/privacy_policy_screen.dart';
import 'package:news_app/presentation/viewmodels/preferences_viewmodel.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Watch preferences for reactive updates
    final preferences = ref.watch(preferencesProvider);
    final isDarkMode = preferences.isDarkMode;
    final l10n = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        children: [
          //Beautiful drawer header with gradient
          _BuildDrawerHeader(context, l10n),

          //Navigation items
          _buildDrawerItem(
            context,
            icon: Icons.notifications_outlined,
            title: l10n.notifications,
            subtitle: l10n.viewNotifications,
            onTap: () => _navigateToScreen(context, const NotificationScreen()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.bookmark_outline,
            title: l10n.bookmarks,
            subtitle: l10n.customizeBookmarks,
            onTap: () => _navigateToScreen(context, const BookmarksScreen()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person_outline,
            title: l10n.personalization,
            subtitle: l10n.viewPersonalizedNews,
            onTap: () =>
                _navigateToScreen(context, const PersonalizationScreen()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.article_outlined,
            title: l10n.newsSources,
            subtitle: l10n.arrangeNewsSources,
            onTap: () => _navigateToScreen(context, const NewsSourcesScreen()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.edit_outlined,
            title: l10n.newsCategories,
            subtitle: l10n.changeNewsCategories,
            onTap: () =>
                _navigateToScreen(context, const NewsCategoriesScreen()),
          ),

          const Divider(height: 32),

          _buildDrawerItem(
            context,
            icon: Icons.info_outline,
            title: l10n.disclaimer,
            subtitle: l10n.disclaimer,
            onTap: () => _navigateToScreen(context, const DisclaimerScreen()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.privacy_tip_outlined,
            title: l10n.privacyPolicy,
            subtitle: l10n.privacyPolicy,
            onTap: () =>
                _navigateToScreen(context, const PrivacyPolicyScreen()),
          ),
          const Divider(height: 32),
          //Theme toggle with smooth animation
          _buildThemeToggle(context, ref, isDarkMode, l10n),

          //language selector
          _buildLanguageSelector(context, ref, preferences.languageCode, l10n),
        ],
      ),
    );
  }

  //Drawer header
  Widget _BuildDrawerHeader(BuildContext context, AppLocalizations l10n) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Animated avatar with shadow
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary.withOpacity(0.2),
              child: Icon(
                Icons.person,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.appTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  //build individual drawer item with consistent styling
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      onTap: onTap,
      hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
    );
  }

  ///Theme toggle switch with icon
  Widget _buildThemeToggle(
    BuildContext context,
    WidgetRef ref,
    bool isDarkMode,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Text(
              isDarkMode ? l10n.darkMode : l10n.lightMode,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              //Update theme through ViewModel
              ref.read(preferencesProvider.notifier).toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }

  ///Language selector dropdown
  Widget _buildLanguageSelector(
    BuildContext context,
    WidgetRef ref,
    String currentLanguage,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.language, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 32),
          Expanded(
            child: DropdownButton<String>(
              value: currentLanguage,
              isExpanded: true,
              underline: const SizedBox(),
              items: [
                DropdownMenuItem(value: 'en', child: Text(l10n.english)),
                DropdownMenuItem(value: 'ne', child: Text(l10n.nepali)),
              ],
              onChanged: (String? newValue) {
                if (newValue != null) {
                  //update language through ViewModel
                  ref
                      .read(preferencesProvider.notifier)
                      .changeLanguage(newValue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  ///Helper method to navigate and close drawer
  void _navigateToScreen(BuildContext context, Widget screen) {
    //Navigator.pop(context); //close drawer
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
