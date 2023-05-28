import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GitaProvider extends ChangeNotifier {
  static List<Map<String, dynamic>> chaptersList = [];
  static List<Map<String, dynamic>> verseList = [];
  static List<Map<String, dynamic>> vTranslationList = [];
  static List<Map<String, dynamic>> commentaryList = [];
  static int selChapter = 0;
  static int selVerse = 1;

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

  Future<void> verseTranslationJson() async {
    String data = await rootBundle
        .loadString("assets/json/corrected_translation_gpt3.json");
    for (var e in json.decode(data)) {
      if (e['author_id'] == 1) {
        vTranslationList.add(e);
      }
    }
  }

  Future<void> commentaryJson() async {
    String data = await rootBundle.loadString("assets/json/commentary.json");
    for (var e in json.decode(data)) {
      if (e['author_id'] == 1) {
        commentaryList.add(e);
      }
    }
  }
}
