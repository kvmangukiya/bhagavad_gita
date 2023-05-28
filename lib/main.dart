import 'package:bhagavad_gita/views/screens/bhagavad_gita.dart';
import 'package:bhagavad_gita/views/screens/chapter_screen.dart';
import 'package:bhagavad_gita/views/screens/verse_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/gita_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GitaProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bhagavad Gita',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => const BhagavadGita(),
          "chapter_screen": (context) => const ChapterScreen(),
          "verse_details": (context) => const VerseDetails(),
        });
  }
}
