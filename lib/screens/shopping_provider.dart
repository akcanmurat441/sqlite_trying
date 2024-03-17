import 'package:flutter/material.dart';

import '../models/shopping_item.dart';
import '../services/db_service.dart';

class ShoppingListState extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<ShoppingItem> _items = [];
  List<ShoppingItem> get items => _items;

  Future<void> fetchItems() async {
    await _databaseService.initializeDatabase();
    _items = await _databaseService.getItems();
    notifyListeners();
  }

  Future<void> addItem(String name) async {
    await fetchItems();
    await _databaseService.addItem(name);
    await fetchItems();
  }

  Future<void> deleteItem(int id) async {
    await fetchItems();
    await _databaseService.deleteItem(id);
    await fetchItems();
  }
}
