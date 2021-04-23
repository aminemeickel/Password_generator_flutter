import 'package:flutter_pw_gen/models/gPasswordmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static final _tablename = 'passwords';
  Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    return openDatabase(join(await getDatabasesPath(), 'password.db'),
        onCreate: (db, pos) {
      return db.execute(
          'CREATE TABLE passwords(id INTEGER PRIMARY KEY, password TEXT, time TEXT)');
    }, singleInstance: true, version: 1);
  }

  //ADD
  Future<int> addPassword(GPassword gpassword) async {
    var db = await database;
    var id = (await db!.rawQuery("SELECT MAX(id)+1 as id FROM $_tablename"))
        .first['id'];
    if (id == null) {
      id = 0;
    }
    return db.insert(_tablename, gpassword.toMap(id as int),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //GET
  Future<List<Map>?> getAll() async {
    var db = await database;
    return db?.rawQuery('SELECT * FROM $_tablename ');
  }

  //REMOVE
  Future<int?> removepassword(int gpasswordID) async {
    var db = await database;
    return db?.delete(_tablename, where: 'id = ?', whereArgs: [gpasswordID]);
  }

  //CLear
  Future<int?> clearpasswords() async {
    var db = await database;
    return db?.delete(_tablename);
  }

  getPassword(int iD) async {
    var db = await database;
    return db?.query(_tablename, where: 'Id = ?', whereArgs: [iD]);
  }
}
