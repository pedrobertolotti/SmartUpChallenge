import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'createAccount.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'createAccount.dart';

class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(username TEXT PRIMARY KEY, name TEXT NOT NULL)",
        );
      },
    );
  }

  Future<void> addUser(Users user) async {
    final Database db = await initializedDB();
    await db.insert('users', user.toMap());
  }

  Future<List<Users>> retrieveUsers() async {
    final Database db = await initializedDB();
    final List<Map<String, dynamic>> queryResult = await db.query('users');
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }
}




/*

class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(username TEXT PRIMARY KEY, name TEXT NOT NULL)",
        );
      },
    );
  }

  Future<void> addUser(Users user) async {
    final Database db = await initializedDB();
    await db.insert('users', user.toMap());
  }

  Future<List<Users>> retrieveUsers() async {
    final Database db = await initializedDB();
    final List<Map<String, dynamic>> queryResult = await db.query('users');
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }
}








//Si uso esto sace dos handler= databa

class DataBase {
  static final DataBase instance = DataBase._init();

  static Database? _database;

  DataBase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initializedDB();
    return _database!;
  }

  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(username TEXT PRIMARY KEY, name TEXT NOT NULL)",
        );
      },
    );
  }

  Future<void> addUser(Users user) async {
    final Database db = await database;
    await db.insert('users', user.toMap());
  }

  Future<List<Users>> retrieveUsers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> queryResult = await db.query('users');
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }
}

}*/
