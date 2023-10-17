import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import "Model.dart";

class DatabaseHelper {
  Database? _database;

  Future<void> open() async {
    if (_database != null) return;

    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertUser(User user) async {
    await open();
    await _database!.insert('users', user.toMap());
  }
}
