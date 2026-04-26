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

  ///Build individual notification card
  ///Shows notification with icon, title, and timestamp

  Widget _buildNotificationCard(
    BuildContext context,
    int index,
    AppLocalizations l10n,
  ) {
    //Different notification types for variety
    final types = [
      _NotificationType(
        icon: Icons.article,
        color: Colors.blue,
        title: 'News Article Available',
      ),
      _NotificationType(
        icon: Icons.trending_up,
        color: Colors.green,
        title: 'Trending News',
      ),
      _NotificationType(
        icon: Icons.bookmark_added,
        color: Colors.orange,
        title: 'Bookmark Saved',
      ),
    ];

    final type=types[index% types.length];

    return Card(
      
    );
  }
}

///Data class for notificaton types
class _NotificationType {
  final IconData icon;
  final Color color;
  final String title;

  _NotificationType({
    required this.icon,
    required this.color,
    required this.title,
  });
}
