import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqfdb {
  Database? _database;

  Future<Database?> get db async {
    if (_database == null) {
      _database = await init();
      return _database;
    } else {
      return _database;
    }
  }

  init() async {
    String db = await getDatabasesPath();
    String path = join(db, 'Database.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    print(db);
    print(path);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print('Upgarde database and table==============================');
  }

  _onCreate(Database db, int version) {
    Batch batch = db.batch();
    batch.execute('''CREATE TABLE notes 
          ( id INTEGER  NOT NULL PRIMARY KEY   AUTOINCREMENT ,
          money TEXT ,
          date  TEXT ,
          content TEXT)
          ''');

    batch.commit();

    print('created database and table==========================');
  }

  selectData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  deletData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteMyDatabase() async {
    String db = await getDatabasesPath();
    String path = join(db, 'Database.db');
    await deleteDatabase(path);
    print('DATABASE delete==============================');
  }
}
