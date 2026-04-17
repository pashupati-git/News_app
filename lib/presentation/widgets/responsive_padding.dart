import 'package:flutter/material.dart';
import 'package:news_app/core/utils/responsive_utils.dart';

///Widgets that provides responsive padding
///Automatically adjusts padding based on screen size
///Reusable component for consistent spacing throughout the app.

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    Key? key,
    required this.child,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets? mobile;
  final EdgeInsets? tablet;
  final EdgeInsets? desktop;

  ///Factory constructor for horizontal padding only
  factory ResponsivePadding.horizontal({
    required Widget child,
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    return ResponsivePadding(
      mobile: EdgeInsets.symmetric(horizontal: mobile ?? 16),
      tablet: EdgeInsets.symmetric(horizontal: tablet ?? 24),
      desktop: EdgeInsets.symmetric(horizontal: desktop ?? 32),
      child: child,
    );
  }

  ///Facto-ry constructor for all-around padding
  factory ResponsivePadding.all({
    required Widget child,
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    return ResponsivePadding(
      mobile: EdgeInsets.all(mobile ?? 16),
      tablet: EdgeInsets.all(tablet ?? 24),
      desktop: EdgeInsets.all(desktop ?? 32),
      child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveUtils.getResponsiveValue(
      context,
      mobile: mobile ?? const EdgeInsets.all(16),
      tablet: tablet,
      desktop: desktop,
    );
    return Padding(padding: padding, child: child);
  }
}
