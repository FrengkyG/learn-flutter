import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setstate_state_management/provider/done_module_provider.dart';

class DoneModuleList extends StatelessWidget {
  DoneModuleList({Key? key}) : super(key: key);

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
    final doneModuleList =
        Provider.of<DoneModuleProvider>(context, listen: false).doneModuleList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Module List'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        }),
        itemCount: doneModuleList.length,
      ),
    );
  }
}
