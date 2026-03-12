import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._initialize();
  static Database? _database;
  final String fileName = 'finance_app.db';
  //version of the database, increment this when you make changes to the database schema
  final int dbCurrentVersion = 1;

  DatabaseHelper._initialize();

  //get the database, if it doesn't exist, create it
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase(fileName);
    return _database!;
  }

  //initialize the database
  Future<Database> _initializeDatabase(String filePath) async {
    //platform-specific path to store the database
    final dbPath = await getDatabasesPath();

    //safely join the path and file name to get the full path to the database file
    final path = join(dbPath, filePath);

    //open existing database or create a new one if it doesn't exist
    return await openDatabase(
        path,
        version: dbCurrentVersion,
        onCreate: _createDB);
  }

  //create the database schema
  Future<void> _createDB(Database db, int version) async {
    //monthly_expenses table
    await db.execute('''
      CREATE TABLE monthly_expenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        amount REAL NOT NULL,
        category TEXT NOT NULL
      )
    ''');
  }
}