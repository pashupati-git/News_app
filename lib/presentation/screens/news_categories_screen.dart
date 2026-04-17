import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsCategoriesScreen extends ConsumerWidget{
  const NewsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Categories')),
      body: const Center(child: Text('News Categories Screen')),
    );
  }
}