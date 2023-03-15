part of '../admin_page.dart';

class _ChangeUserScopes extends ConsumerStatefulWidget {
  const _ChangeUserScopes({super.key, required this.scopes});

  final List<String> scopes;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ChangeUserScopesState();
}

class __ChangeUserScopesState extends ConsumerState<_ChangeUserScopes> {
  final scopes = <String>[];

  @override
  void initState() {
    super.initState();
    scopes.addAll(widget.scopes);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('change_scopes').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                for (final scope in ['admin', 'editor', 'export'])
                  CheckboxListTile(
                    title: Text(scope).tr(),
                    value: scopes.contains(scope),
                    onChanged: (value) {
                      if (value == true) {
                        scopes.add(scope);
                      } else {
                        scopes.remove(scope);
                      }
                      setState(() {});
                    },
                  ),
              ],
            )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('cancel',
                          style: TextStyle(color: Colors.white))
                      .tr(),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(scopes);
                  },
                  child: const Text('change_scopes').tr(),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
