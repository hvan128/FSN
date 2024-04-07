import 'package:frontend/database/database_service.dart';
import 'package:frontend/models/position.dart';
import 'package:sqflite/sqflite.dart';

class PositionDB {
  final tableName = 'positions';
  Future<void> createTable(Database db) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS $tableName (
          "id" INTEGER NOT NULL, 
          "label" TEXT NOT NULL, 
          "value" TEXT NOT NULL, 
          PRIMARY KEY("id" AUTOINCREMENT)
          )''');
  }

  Future<int> addPosition({required Position position}) async {
    final db = await DatabaseService().database;
    return db.rawInsert('''INSERT INTO $tableName(label, value) VALUES(?, ?)''',
        [position.label, position.value]);
  }

  Future<List<Position>> getPositions() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM $tableName ORDER BY id COLLATE NOCASE ASC'
    );
    return List.generate(maps.length, (i) {
      return Position(
        id: maps[i]['id'],
        label: maps[i]['label'],
        value: maps[i]['value'],
      );
    });
  }
}
