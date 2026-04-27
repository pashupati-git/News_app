import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/utils/responsive_utils.dart';
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
      body: ListView.builder(
        padding: EdgeInsets.all(context.horizontalPadding),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildNotificationCard(context, index, l10n);
        },
      ),
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

    final type = types[index % types.length];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: context.isMobile ? 1 : 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: type.color.withOpacity(0.2),
          child: Icon(type.icon, color: type.color),
        ),
        title: Text(
          type.title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          l10n.notificationDetail(index + 1),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.hoursAgo(index + 1),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            // Unread indicator
            if (index < 3)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {
          //TODO : Navigate to notification detail
        },
      ),
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
