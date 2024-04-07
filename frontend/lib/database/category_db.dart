import 'package:frontend/database/database_service.dart';
import 'package:frontend/models/category.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDb {
  final tableName = 'categories';
  Future<void> createTable(Database db) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS $tableName (
          "id" INTEGER NOT NULL, 
          "label" TEXT NOT NULL, 
          "value" TEXT NOT NULL,
          "icon" TEXT NOT NULL,
          "type" TEXT NOT NULL,  
          "unit" TEXT NOT NULL, 
          "quantity" INTEGER, 
          "position_id" INTEGER,
          "sub_position_id" INTEGER,
          "manufacture_date" INTEGER, 
          "expiry_date" INTEGER,
          PRIMARY KEY("id" AUTOINCREMENT)
          FOREIGN KEY("position_id") REFERENCES "positions"("id")
          )''');
  }

  Future<int> addCategory({required Category category}) async {
    final db = await DatabaseService().database;
    return db.rawInsert(
        '''INSERT INTO $tableName(label, value, icon, type, unit, quantity, position_id, sub_position_id, manufacture_date, expiry_date) VALUES(?, ?, ?, ?, ?, ?, ?, ?)''',
        [
          category.label,
          category.value,
          category.icon,
          category.type,
          category.unit,
          category.quantity,
          category.positionId,
          category.subPositionId,
          category.manufactureDate.millisecondsSinceEpoch,
          category.expiryDate.millisecondsSinceEpoch
        ]);
  }

  Future<List<Category>> getCategories() async {
    final db = await DatabaseService().database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM $tableName ORDER BY manufacture_date COLLATE NOCASE ASC');
    return List.generate(maps.length, (i) {
      return Category(
        id: maps[i]['id'],
        label: maps[i]['label'],
        value: maps[i]['value'],
        icon: maps[i]['icon'],
        type: maps[i]['type'],
        unit: maps[i]['unit'],
        quantity: maps[i]['quantity'],
        positionId: maps[i]['position_id'],
        subPositionId: maps[i]['sub_position_id'],
        manufactureDate:
            DateTime.fromMillisecondsSinceEpoch(maps[i]['manufacture_date']),
        expiryDate: DateTime.fromMillisecondsSinceEpoch(maps[i]['expiry_date']),
      );
    });
  }

  Future<void> updateCategory({required Category category}) async {
    final db = await DatabaseService().database;
    await db.update(
        tableName,
        {
          'label': category.label,
          'value': category.value,
          'icon': category.icon,
          'type': category.type,
          'unit': category.unit,
          'quantity': category.quantity,
          'position_id': category.positionId,
          'sub_position_id': category.subPositionId,
          'manufacture_date': category.manufactureDate.millisecondsSinceEpoch,
          'expiry_date': category.expiryDate.millisecondsSinceEpoch
        },
        where: 'id = ?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [category.id]);
  }

  Future<void> deleteCategory({required int id}) async {
    final db = await DatabaseService().database;
    await db.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]);
  }
}
