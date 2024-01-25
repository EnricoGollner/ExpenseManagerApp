import 'package:expenses_manager_app/src/core/utils/db_utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBRepostiory {
  Database? _db;

  Future<Database> getDatabase() async {
    if (_db == null) {
      _db = await initDatabase();
      return _db!;
    }
    
    return _db!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), DBUtils.dbName),
      version: 1,
      onCreate: (db, version) => db.execute(DBUtils.createTableQuery),
    );
  }
}
