import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/utils/responsive_utils.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/presentation/widgets/custom_drawer.dart';
import 'package:news_app/presentation/widgets/responsive_padding.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
        elevation: 0,
        actions: [
          //search icon- placeholder for future search functionality.
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //TODO:implement search
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: ResponsivePadding.all(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Responsive icon size
              Icon(
                Icons.home_rounded,
                size: context.isMobile ? 80 : 120,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: context.verticalSpacing),

              //Welcome message
              Text(
                l10n.welcomeMessage,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: context.verticalSpacing * 2),
            ],
          ),
        ),
      ),
    );
  }
}


///Build feature cards shows app capabilities
///uses responsive grid that adapts to screen size
Widget _buildFeatureCards(BuildContext context,AppLocalizations l10n){
  final features=[
    // _FeatureData()
  ];
}

/// Data class for feature cards
class _FeatureData{
  final IconData icon;
  final String title;
  final Color color;

  _FeatureData({
    required this.icon,
    required this.title,
    required this.color,
  });
}