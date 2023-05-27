import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeetaProvider extends ChangeNotifier {
  static List<Map<String, dynamic>> chaptersList = [];

  Future<void> chaptersJson() async {
    String data = await rootBundle.loadString("assets/json/chapters.json");
    for (var e in json.decode(data)) {
      chaptersList.add(e);
    }
    notifyListeners();
  }
}
