import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper{
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();                                //get database path for creating new database
    final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'),       //to open the database if existing or create one if not there
    onCreate: (db, version) {                                              //on create will give the access to db & the current version of new db
     return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1,);
    await sqlDb.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}