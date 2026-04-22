import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/presentation/widgets/responsive_padding.dart';

///Disclaimer screen with legal information.
/// Demonstrates text-heavy content layout
/// Uses responsove pading and typography.

class DisclaimerScreen extends ConsumerWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.disclaimer)),
      body: SingleChildScrollView(
        child: ResponsivePadding.all(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title with icon
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.disclaimerTitle,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              //Content sections
              _buildContentSection(context, l10n.disclaimerContent),
              const SizedBox(height: 16),
              _buildContentSection(context, l10n.disclaimerResponsibility),

              const SizedBox(height: 32),

              //Accept button
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('I Understand'),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build content sections with card styling
  Widget _buildContentSection(BuildContext context, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
      ),
    );
  }
}
