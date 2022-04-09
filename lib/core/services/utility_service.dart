import 'package:flutter/material.dart';

class UtilityService {
  List<DropdownMenuItem> getDropdownItems(
      {required List items, TextStyle? style}) {
    List<DropdownMenuItem> dropdowmItems = [];

    for (String item in items) {
      var newItem = DropdownMenuItem(
          child: Text(
            item,
            style: const TextStyle(color: Colors.white),
          ),
          value: item);
      dropdowmItems.add(newItem);
    }
    return dropdowmItems;
  }
}
