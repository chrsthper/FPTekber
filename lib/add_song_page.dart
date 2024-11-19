import 'package:flutter/material.dart';

class AddSongPage extends StatefulWidget {
  @override
  _AddSongPageState createState() => _AddSongPageState();
}

class _AddSongPageState extends State<AddSongPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController artistController = TextEditingController();
  final TextEditingController lyricsController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController meaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Song'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Song Title"),
            ),
            TextField(
              controller: artistController,
              decoration: InputDecoration(labelText: "Artist Name"),
            ),
            TextField(
              controller: lyricsController,
              decoration: InputDecoration(labelText: "Lyrics"),
              maxLines: 3,
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            TextField(
              controller: meaningController,
              decoration: InputDecoration(labelText: "Meaning"),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newSong = {
                  "title": titleController.text,
                  "artist": artistController.text,
                  "lyrics": lyricsController.text,
                  "imageUrl": imageUrlController.text,
                  "meaning": meaningController.text,
                };
                Navigator.pop(context, newSong);
              },
              child: Text("Add Song"),
            ),
          ],
        ),
      ),
    );
  }
}
