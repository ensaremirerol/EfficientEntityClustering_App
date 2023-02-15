import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponsiveBuilder extends ConsumerWidget {
  const ResponsiveBuilder(
      {super.key,
      required this.smallScreen,
      this.mediumScreen,
      this.largeScreen,
      this.smallScreenBreakpoint = 600,
      this.mediumScreenBreakpoint = 1200});

  final double smallScreenBreakpoint;
  final double mediumScreenBreakpoint;

  final Widget smallScreen;
  final Widget? mediumScreen;
  final Widget? largeScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < smallScreenBreakpoint) {
          return smallScreen;
        } else if (constraints.maxWidth < mediumScreenBreakpoint) {
          return mediumScreen ?? smallScreen;
        } else {
          return largeScreen ?? mediumScreen ?? smallScreen;
        }
      },
    );
  }
}
