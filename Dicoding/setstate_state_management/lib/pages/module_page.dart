import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setstate_state_management/pages/done_module_list_page.dart';
import 'package:setstate_state_management/provider/done_module_provider.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memulai Pemrograman Dengan Dart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoneModuleList(),
                ),
              );
            },
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: ModuleList(doneModuleList: doneModuleList),
    );
  }
}

class ModuleList extends StatefulWidget {
  final List<String> doneModuleList;
  const ModuleList({Key? key, required this.doneModuleList}) : super(key: key);

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  final List<String> moduleList = [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Memulai Pemrograman dengan Dart',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: moduleList.length,
        itemBuilder: (context, index) {
          return Consumer<DoneModuleProvider>(
              builder: (context, DoneModuleProvider data, widget) {
            return ModuleTile(
              moduleName: moduleList[index],
              isDone: data.doneModuleList.contains(moduleList[index]),
              onClick: () {
                data.complete(moduleList[index]);
              },
            );
          });
        });
  }
}

class ModuleTile extends StatelessWidget {
  final String moduleName;
  final bool isDone;
  final Function() onClick;
  const ModuleTile(
      {Key? key,
      required this.moduleName,
      required this.isDone,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? Icon(Icons.done)
          : ElevatedButton(
              child: const Text('Done'),
              onPressed: onClick,
            ),
    );
  }
}
