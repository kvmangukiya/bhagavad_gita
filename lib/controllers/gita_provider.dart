import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GitaProvider extends ChangeNotifier {
  static List<Map<String, dynamic>> chaptersList = [];
  static List<Map<String, dynamic>> verseList = [];
  static int selChapter = 0;

  Future<void> chaptersJson() async {
    String data = await rootBundle.loadString("assets/json/chapters.json");
    for (var e in json.decode(data)) {
      chaptersList.add(e);
    }
    notifyListeners();
  }

  Future<void> verseJson() async {
    String data = await rootBundle.loadString("assets/json/verse.json");
    for (var e in json.decode(data)) {
      verseList.add(e);
    }
  }
}
