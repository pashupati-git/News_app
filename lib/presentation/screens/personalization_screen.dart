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
          ...List.generate(
            8,
            (index) => _buildArticleCard(context, index, l10n),
          ),
        ],
      ),
    );
  }

  ///Build personalized article card
  Widget _buildArticleCard(
    BuildContext context,
    int index,
    AppLocalizations l10n,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: context.isMobile ? 1 : 2,
      child: InkWell(
        onTap: () {
          //TODO: Navigate to article detail
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Article header with category badge
              Row(
                children: [
                  _buildCategoryBadge(context, index),
                  const Spacer(),
                  Text(
                    '${index + 1}h ago',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              //Article title
              Text(
                l10n.personalizedArticle(index + 1),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              //Article excerpt
              Text(
                l10n.personalizedArticleDescription,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              //Article footer with actions
              Row(
                children: [
                  //Source
                  Icon(
                    Icons.source,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),

                  const SizedBox(width: 4),
                  Text(
                    'BBC News',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const Spacer(),

                  //Bookmark button
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_outline),
                    iconSize: 20,
                  ),

                  //Share button
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    iconSize: 20,
                    onPressed: () {
                      //TODO: Share article
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build category badge with color
  Widget _buildCategoryBadge(BuildContext context, int index) {
    final categories = ['Technology', 'Sports', 'Politics', 'Business'];
    final colors = [Colors.blue, Colors.green, Colors.red, Colors.orange];

    final category = categories[index % categories.length];
    final color = colors[index % colors.length];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        category,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
