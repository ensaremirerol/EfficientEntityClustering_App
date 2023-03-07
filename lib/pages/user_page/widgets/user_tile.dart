part of '../user_page.dart';

class _UserListTile extends StatelessWidget {
  const _UserListTile({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading: leading,
            trailing: trailing,
            onTap: onTap),
      ),
    );
  }
}
