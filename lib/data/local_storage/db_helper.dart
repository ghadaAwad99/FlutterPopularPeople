import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const _DATA_BASE_NAME = "movies.db";
  static const _DATA_BASE_VERSION = 2;
  static const _TABLE = 'movies';
  static const COLUMN_IMAGE = 'image';
  static const COLUMN_RATING = 'rating';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_RELEASE_YEAR = 'releaseYear';

  DbHelper._();
  static final DbHelper instance = DbHelper._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_TABLE (
            $COLUMN_TITLE TEXT PRIMARY KEY,
            $COLUMN_IMAGE TEXT,
            $COLUMN_RATING INTEGER,
            $COLUMN_RELEASE_YEAR INTEGER
          )
          ''');
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(_TABLE, row);
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    return await db?.query(_TABLE);
  }
}
