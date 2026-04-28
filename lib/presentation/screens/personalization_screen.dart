import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/utils/responsive_utils.dart';
import 'package:news_app/l10n/app_localizations.dart';

/// Personalization screen showing personalized news feed
/// Demonstrates card-based content layout
/// Content adapts based on user preferences
class PersonalizationScreen extends ConsumerWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.personalization),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Show filter options
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(context.horizontalPadding),
        children: [
          //Section header
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              l10n.personalizedNewsFeed,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          // Personalized articles
          // ...List.generate(8, _buildArticleCard(context, index, l10n)),
        ],
      ),
    );
  }
}
