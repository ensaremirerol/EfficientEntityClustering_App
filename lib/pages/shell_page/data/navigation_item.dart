part of '../shell_page.dart';

class NavigationItem {
  final String title;
  final int index;
  final IconData icon;
  final String route;

  const NavigationItem({
    required this.title,
    required this.index,
    required this.icon,
    required this.route,
  });
}
