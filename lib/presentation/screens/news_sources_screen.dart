import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsSourcesScreen extends ConsumerWidget{
  const NewsSourcesScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Sources')),
      body: const Center(child: Text('News Sources Screen')),
    );
  }
}