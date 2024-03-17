import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/shopping_item.dart';

class DatabaseService {
  Database? _database;

  Future<void> initializeDatabase() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), 'shopping.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<List<ShoppingItem>> getItems() async {
    final Database db = _database!;
    final List<Map<String, dynamic>> maps = await db.query('items');

    return List.generate(maps.length, (i) {
      return ShoppingItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> addItem(String name) async {
    final Database db = _database!;
    await db.insert('items', {'name': name});
  }

  Future<void> deleteItem(int id) async {
    final Database db = _database!;
    await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
}
