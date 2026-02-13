import 'package:flutter/material.dart';

//Utility class for responsive design
//Provides breakpoints and helper methods for adaptive layouts
//Supports mobile, tablet and desktop screen sizes

class ResponsiveUtils {
  ResponsiveUtils._();

  //Breakpoints constamts
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  ///Check if current screen size is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  ///Check if current screen size is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  ///Check if current screen size is desktop size
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  ///Get responsive value based on screen size
  ///returns different values for mobile,tablet, and desktop
  ///This function is called generic function
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  ///use of generic function:-
  // double fontSize = ResponsiveUtils.getResponsiveValue(
  //   context,
  //   mobile: 14.0,    // ← Flutter sees this is a double
  //   tablet: 18.0,    // ← So T becomes double
  //   desktop: 22.0,
  // );
  // // Here, T = double

  ///Get numbers of grid coloumns based on screen size
  static int getGridColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTablet(context)) return 3;
    return 2;
  }

  ///Get horizontal padding based on screen size
  static double getHoizontalPadding(BuildContext context) {
    if (isDesktop(context)) return 32.0;
    if (isTablet(context)) return 24.0;
    return 16.0;
  }

  ///Get vertical spacing based on screen size
  static double getVerticalPadding(BuildContext context) {
    if (isDesktop(context)) return 24.0;
    if (isTablet(context)) return 20.0;
    return 16.0;
  }

  ///Get card elevation based on screen size
  static double getCardElevation(BuildContext context) {
    if (isDesktop(context)) return 2.0;
    return 1.0;
  }

  ///Get app bar height based on screen size
  static double getAppBarHeight(BuildContext context) {
    if (isDesktop(context)) return 64.0;
    return 56.0;
  }
}

///Widgets that builds different layouts based on screen size
///Cleaner alternative to using Responsive methods directly
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtils.getResponsiveValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

///Extension on BuidContext for easier responsive access
extension ResponsiveContext on BuildContext{
  bool get isMobile => ResponsiveUtils.isMobile(this);
  bool get isTablet => ResponsiveUtils.isTablet(this);
  bool get isDesktop => ResponsiveUtils.isDesktop(this);

  int get gridColumns => ResponsiveUtils.getGridColumns(this);
  double get horizontalPadding => ResponsiveUtils.getHoizontalPadding(this);
  double get verticalPadding => ResponsiveUtils.getVerticalPadding(this);
  double get cardElevation => ResponsiveUtils.getCardElevation(this);
  double get appBarHeight => ResponsiveUtils.getAppBarHeight(this);
}

