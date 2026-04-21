import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/utils/responsive_utils.dart';
import 'package:news_app/l10n/app_localizations.dart';

///Bookmarks screen showing saved articles
///Demonstrates responsive grid layout
///Grid columns adapt based on screen size

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.bookmarks),
        actions: [
          //Clear all bookmarks button
          IconButton(
            onPressed: () {
              _showClearDialog(context);
            },
            icon: Icon(Icons.delete_outline),
            tooltip: 'Clear All',
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(context.horizontalPadding),

        //Responsive grid columns
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.gridColumns,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildBookmarkCard(context, index, l10n);
        },
      ),
    );
  }

  ///Build individual bookmark card
  ///Shows article thumbnail, title, and action buttons

  Widget _buildBookmarkCard(
    BuildContext context,
    int index,
    AppLocalizations l10n,
  ) {
    return Card(
      elevation: context.isMobile ? 1 : 2,

      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          //TODO: Navigate to article details
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Article thumbnail
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.article,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            //Article info
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        l10n.bookmark(index + 1),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${index + 1}d ago',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                fontSize: 11,
                              ),
                        ),
                        const Spacer(),
                        //Remove bookmarks button
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                            onPressed: () {
                              //TODO:Remove bookmark
                            },
                            icon: const Icon(Icons.bookmark),
                            iconSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Show confirmation dialog for clearing all bookmarks
void _showClearDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Clear All Bookmarks'),
      content: const Text('Are you sure you want to remove all bookmarks?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            //TODO:Clear all bookmarks
            Navigator.pop(context);
          },
          child: const Text('Clear'),
        ),
      ],
    ),
  );
}
