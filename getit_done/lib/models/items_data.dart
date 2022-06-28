import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    /*Item(title: 'Peynir al'),
    Item(title: 'Çöpü At'),
    Item(title: 'Faturayı Öde'),*/
  ];
  static SharedPreferences? _sharedPref;
  List<String> _itemAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItmesToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    saveItmesToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItmesToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // Shared Pref metotları

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }




  void saveItmesToSharedPref(List<Item> items) {
    _itemAsString.clear();
    //List<Item> --> List<String>
    for (var item in items) {
      //stringe json ile çevirme
      _itemAsString.add(json.encode(item.toMap()));
    }
    //sharedprefer kaydetsin

    _sharedPref!.setStringList('toDoData', _itemAsString);
  }
//as List<String>
  //Stringden objeye çevirme
  void loadItemsFromSharedPref() {

    List<String> tempList = _sharedPref!.getStringList('toDoData') ??[]   ;
    _items.clear();
    for (var item in tempList) {
      //string--->map---->obje
      //json.decode(item)-->Item.fromMap(json.decode(item))-->obje
      _items.add(Item.fromMap(json.decode(item)));
    }
  }
}
