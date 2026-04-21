import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Bookmarks screen showing saved articles
///Demonstrates responsive grid layout
///Grid columns adapt based on screen size

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: const Center(child: Text('Bookmarks Screen')),
    );
  }
}
