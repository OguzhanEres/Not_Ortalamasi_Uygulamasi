import 'package:flutter/material.dart';

class DataHelperKredi {
  static List<int> krediler() {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  }

  static List<DropdownMenuItem<int>> KrediDegerleri() {
    return krediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e,
            ))
        .toList();
  }
}
