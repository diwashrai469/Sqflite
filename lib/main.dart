import 'package:flutter/material.dart';
import 'package:sqf_lite/screen/screen.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:sqflite/sqlite_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// getting path of document directory
  final docPath = await pathProvider.getApplicationDocumentsDirectory();
  print(docPath.path);

  ///database created
  final dbFile = 'todos.db';
  print(dbFile);

  //joining path and pathprovider
  final dbFilePath = path.join(docPath.path, dbFile);
  print(dbFilePath);

  final db = await sqflite.openDatabase(dbFilePath, version: 3,
      onCreate: (database, version) {
    database.execute(
        'Create Table todo(id Integer Primary Key,done int, task Text,done Integer,created_at Integer,updated_at Text,remarks Text,created_by Text,expire_data Text)');
  });
  print('db is open:${db.isOpen}');
  

  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Myapp(
        db: db,
      )));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key, required this.db});
  final Database db;

  @override
  Widget build(BuildContext context) {
    return HomePage(db: db,);
  }
}
