import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  static Future<Database> setDatabase() async {
    // getter to open a connection to database
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_crud');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  static Future<void> _createDatabase(Database database, int version) async {
    const db = """CREATE TABLE users (
          id INTEGER PRIMARY KEY,
          correlation TEXT NOT NULL,
          name TEXT NOT NULL,
          age TEXT NOT NULL,
          birthday TEXT NOT NULL,
          contact TEXT NOT NULL,
          description TEXT NOT NULL
          );""";
    await database.execute(db);
  }
}
