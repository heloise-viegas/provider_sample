import 'dart:collection';

import 'package:flutter/material.dart';

class ItemData extends ChangeNotifier {
  List<String> _items = ['A', 'B', 'C'];

  int get itemCount {
    return _items.length;
  }

  UnmodifiableListView<String> get items {
    return UnmodifiableListView(_items);
  }

  void addItem(String newItem) {
    _items.add(newItem);
    notifyListeners();
  }
}
