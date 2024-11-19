import 'package:flutter/material.dart';

class SongMeaningPage extends StatelessWidget {
  final String songTitle;
  final String meaning;

  const SongMeaningPage({Key? key, required this.songTitle, required this.meaning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meaning of $songTitle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          meaning,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
