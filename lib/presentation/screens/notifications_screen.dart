import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/l10n/app_localizations.dart';

/// Notification screen showing user notifications
/// Demonstrates list building with localized content
/// Uses reponsive design for different screen sizes
class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notifications),
        actions: [
          //Mark all as read button
          IconButton(
            onPressed: () {
              //TODO: Implement mark all as read
            },
            icon: const Icon(Icons.done_all),
          ),
        ],
      ),
      body: const Center(child: Text('Notifications Screen')),
    );
  }
}
