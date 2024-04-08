import 'package:frontend/database/category_db.dart';
import 'package:frontend/database/position_db.dart';
import 'package:frontend/database/sub_position_db.dart';
import 'package:frontend/models/position.dart';
import 'package:frontend/models/sub_position.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'fsn.db';
    final databasesPath = await getDatabasesPath();
    return join(databasesPath, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var db = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return db;
  }

  Future<void> create(Database db, int version) async {
    await CategoryDb().createTable(db);
    await PositionDB().createTable(db);
    await SubPositionDb().createTable(db);
    _initData(db);
  }

  Future<void> _initData (Database db ) async {
    await db.transaction((txn) async {
      Batch batch = txn.batch();
      batch.insert('positions', {'label': 'Lạnh', 'value': 'lanh'});
      batch.insert('positions', {'label': 'Đông', 'value': 'dong'});
      batch.insert('positions', {'label': 'Bếp', 'value': 'bep'});
      batch.insert('sub_positions', {'label': 'Không có', 'value': '0', 'position_id': 1});
      batch.insert('sub_positions', {'label': 'Không có', 'value': '0', 'position_id': 2});
      batch.insert('sub_positions', {'label': 'Không có', 'value': '0', 'position_id': 3});
      await batch.commit();
    });
  }
}
