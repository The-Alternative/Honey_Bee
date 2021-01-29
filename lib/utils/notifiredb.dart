import 'package:clock_app/models/db_models.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';
class CountryProvider with ChangeNotifier {
  List<String> _items = [
    "Argentina",
    "Brazil",
    "Spain",
    "Switzerland",
  ];

  String _selectedItem;

  List<String> get items => _items;

  String get selected => _selectedItem;

  void setSelectedItem(String s) {
    _selectedItem = s;
    notifyListeners();
  }
}
