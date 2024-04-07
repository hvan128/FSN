import 'package:frontend/database/database_service.dart';
import 'package:frontend/models/sub_position.dart';
import 'package:sqflite/sqflite.dart';

class SubPositionDb {
  final tableName = 'sub_positions';
  Future<void> createTable(Database db) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS $tableName (
          "id" INTEGER NOT NULL, 
          "label" TEXT NOT NULL, 
          "position_id" INTEGER NOT NULL, 
          "value" TEXT NOT NULL,
          PRIMARY KEY("id" AUTOINCREMENT),
          FOREIGN KEY("position_id") REFERENCES "positions"("id")
          )''');
  }

  Future<int> addSubPosition({required SubPosition subPosition}) async {
    final db = await DatabaseService().database;
    return db.rawInsert(
        '''INSERT INTO $tableName(label, position_id, value) VALUES(?, ?, ?)''',
        [subPosition.label, subPosition.positionId, subPosition.value]);
  }

  Future<List<SubPosition>> getSubPositions() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM $tableName ORDER BY id COLLATE NOCASE ASC'
    );
    return List.generate(maps.length, (i) {
      return SubPosition(
        id: maps[i]['id'],
        label: maps[i]['label'],
        positionId: maps[i]['position_id'],
        value: maps[i]['value'],
      );
    });
  }

  Future<List<SubPosition>> getSubPositionsByPositionId(int positionId) async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM $tableName WHERE position_id = $positionId ORDER BY id COLLATE NOCASE ASC'
    );
    return List.generate(maps.length, (i) {
      return SubPosition(
        id: maps[i]['id'],
        label: maps[i]['label'],
        positionId: maps[i]['position_id'],
        value: maps[i]['value'],
      );
    });
  }

  Future<void> deleteSubPosition(int id) async {
    final db = await DatabaseService().database;
    await db.rawDelete('DELETE FROM $tableName WHERE id = $id');
  }

}
