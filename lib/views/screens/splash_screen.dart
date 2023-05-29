import 'dart:async';
import 'package:bhagavad_gita/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/gita_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed('bhagavad_gita');
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GitaProvider>(context, listen: false).chaptersJson();
    Provider.of<GitaProvider>(context, listen: false).verseJson();
    Provider.of<GitaProvider>(context, listen: false).verseTranslationJson();
    Provider.of<GitaProvider>(context, listen: false).commentaryJson();

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/splashbkg.png'),
                  opacity: 0.8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 300),
              const CircularProgressIndicator(color: Colors.white),
              Text("Bhagavad Gita",
                  style: titleTSB(fs: 14, co: Colors.white),
                  textScaleFactor: 2),
              Text(
                "Made with love 💕 in India",
                style: titleTSB(co: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
