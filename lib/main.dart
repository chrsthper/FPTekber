import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(LovetifyApp());
}

class LovetifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lovetify',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Color(0xFF1DB954),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
