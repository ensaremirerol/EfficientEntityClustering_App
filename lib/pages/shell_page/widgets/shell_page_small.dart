part of '../shell_page.dart';

class _ShellPageSmall extends ConsumerWidget {
  const _ShellPageSmall({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eec App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Eec App'),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back))
                ],
              ),
            ),
            ...navigationItems.map((e) {
              final isSelected = e.index == ref.watch(shellPageNumberProvider);
              return ListTile(
                  title: Text(e.title,
                      style: isSelected
                          ? Theme.of(context)
                              .navigationRailTheme
                              .selectedLabelTextStyle
                          : Theme.of(context)
                              .navigationRailTheme
                              .unselectedLabelTextStyle).tr(),
                  leading: Theme(
                      data: Theme.of(context).copyWith(
                          iconTheme: isSelected
                              ? Theme.of(context)
                                  .navigationRailTheme
                                  .selectedIconTheme
                              : Theme.of(context)
                                  .navigationRailTheme
                                  .unselectedIconTheme),
                      child: Icon(e.icon)),
                  selected: isSelected,
                  onTap: () {
                    ref.read(shellPageNumberProvider.notifier).state = e.index;
                    context.go(e.route);
                    Navigator.pop(context);
                  });
            }).toList()
          ],
        ),
      ),
      body: child,
    );
  }
}
