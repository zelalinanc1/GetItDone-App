import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) toggleStatus;
  final  Function(void)  deleteItem;

  const ItemCard(
      {Key? key,
      required this.title,
      required this.isDone,
      required this.toggleStatus,  required this.deleteItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: Key(title),
      child: Card(
        color: isDone ? Colors.green.shade200 : Colors.white,
        elevation: 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.black,decoration: isDone?TextDecoration.lineThrough:null),
          ),
          trailing: Checkbox(
            value: isDone,
            onChanged: toggleStatus,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
