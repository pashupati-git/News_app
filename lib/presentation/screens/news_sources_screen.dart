import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsSourcesScreen extends ConsumerWidget {
  const NewsSourcesScreen({super.key});

  ///News SOurces screen
  ///Allows users to enable/disable and reorder news sources
  ///Demonstrates ReorderableListView and state management
  ///Changes are automatically saved to cache.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Sources')),
      body: const Center(child: Text('News Sources Screen')),
    );
  }
}
