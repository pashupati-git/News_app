import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/presentation/viewmodels/preferences_viewmodel.dart';

class NewsSourcesScreen extends ConsumerWidget {
  const NewsSourcesScreen({super.key});

  ///News SOurces screen
  ///Allows users to enable/disable and reorder news sources
  ///Demonstrates ReorderableListView and state management
  ///Changes are automatically saved to cache.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    //Watch enabled sources from preferences
    final enabledSources = ref.watch(enabledSourcesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.newsSources),
        actions: [
          //Reset to default button
          IconButton(
            onPressed: () {
              ref.read(preferencesProvider.notifier).resetTodefaults();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reset to default sources')),
              );
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset to defaults',
          ),
        ],
      ),

      //ReorderableListView allows drag-annd-drop reordering
      //body:
    );
  }

  ///Build individual source cards with drag handle and toggle
  Widget _buildSourcesCard(
    BuildContext context,
    WidgetRef ref,
    String source,
    int index,
  ) {
    //Check if source is enabled
    final isEnabled = ref
        .watch(preferencesProvider.notifier)
        .isSourceEnabled(source);

    return Card(
      //Unique key required for ReorderableListView
      key: ValueKey(source),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        //Drag handle icon
        leading: Icon(
          Icons.drag_handle,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),

        //Source name with logo placeholder
        title: Row(
          children: [
            //Source logo placeholder
            CircleAvatar(
              radius: 16,
              backgroundColor:_getSourceColor(index).withOpacity(0.2),
              
            ),
          ],
        ),
      ),
    );
  }

  ///Get consistent color for each source
  Color _getSourceColor(int index) {
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }
}
