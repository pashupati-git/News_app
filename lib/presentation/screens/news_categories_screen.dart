import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/presentation/viewmodels/preferences_viewmodel.dart';

///News Categories screen
///Allows users to select/deselect news categories
///Uses checkbox list tiles with beautiful icons
///Changes are persisted automatically through ViewModel
class NewsCategoriesScreen extends ConsumerWidget {
  const NewsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    //Define available categories with localizations
    final categories = [
      _CategoryData(
        id: 'technology',
        name: l10n.technology,
        icon: Icons.computer,
        color: Colors.blue,
      ),
      _CategoryData(
        id: 'sports',
        name: l10n.sports,
        icon: Icons.sports_soccer,
        color: Colors.green,
      ),
      _CategoryData(
        id: 'politics',
        name: l10n.politics,
        icon: Icons.account_balance,
        color: Colors.red,
      ),
      _CategoryData(
        id: 'entertainment',
        name: l10n.entertainment,
        icon: Icons.movie,
        color: Colors.purple,
      ),
      _CategoryData(
        id: 'business',
        name: l10n.business,
        icon: Icons.business_center,
        color: Colors.orange,
      ),
      _CategoryData(
        id: 'health',
        name: l10n.health,
        icon: Icons.health_and_safety,
        color: Colors.pink,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.newsCategories),
        actions: [
          //Select all button
          TextButton(
            child: const Text('Select All'),
            onPressed: () {
              //TODO : Select all categories
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(context, ref, categories[index]);
        },
      ),
    );
  }

  ///Build category card with checkbox
  Widget _buildCategoryCard(
    BuildContext context,
    WidgetRef ref,
    _CategoryData category,
  ) {
    //Check if category is selected
    final isSelected = ref
        .watch(preferencesProvider.notifier)
        .isCategorySelected(category.id);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: CheckboxListTile(
        //Category icon with coored background
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: category.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(category.icon, color: category.color, size: 28),
        ),

        //Category name
        title: Text(
          category.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),

        //Optional description
        subtitle: Text(
          'Get ${category.name.toLowerCase()} news updates',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),

        //Checkbox state
        value: isSelected,

        //Toggle category when checked/unchecked
        onChanged: (bool? value) {
          ref.read(preferencesProvider.notifier).toggleCategory(category.id);
        },

        //Active color matches category color
        activeColor: category.color,
      ),
    );
  }
}

/// Data class for category information
class _CategoryData {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  _CategoryData({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
