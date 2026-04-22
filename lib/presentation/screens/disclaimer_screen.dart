import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


///Disclaimer screen with legal information.
/// Demonstrates text-heavy content layout
/// Uses responsove pading and typography.

class DisclaimerScreen extends ConsumerWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Disclaimer')),
      body: const Center(child: Text('Disclaimer Screen')),
    );
  }
}