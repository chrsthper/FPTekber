import 'package:flutter/material.dart';

class EditSongPage extends StatefulWidget {
  final Map<String, String> song;
  final Function(Map<String, String>) onUpdateSong;

  const EditSongPage({
    required this.song,
    required this.onUpdateSong,
  });

  @override
  _EditSongPageState createState() => _EditSongPageState();
}

class _EditSongPageState extends State<EditSongPage> {
  late TextEditingController _titleController;
  late TextEditingController _artistController;
  late TextEditingController _lyricsController;
  late TextEditingController _imageUrlController;
  late TextEditingController _meaningController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.song['title']);
    _artistController = TextEditingController(text: widget.song['artist']);
    _lyricsController = TextEditingController(text: widget.song['lyrics']);
    _imageUrlController = TextEditingController(text: widget.song['imageUrl']);
    _meaningController = TextEditingController(text: widget.song['meaning']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Song')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Song Title'),
            ),
            TextField(
              controller: _artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: _lyricsController,
              decoration: InputDecoration(labelText: 'Lyrics'),
              maxLines: 3,
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _meaningController,
              decoration: InputDecoration(labelText: 'Meaning'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onUpdateSong({
                  "title": _titleController.text,
                  "artist": _artistController.text,
                  "lyrics": _lyricsController.text,
                  "imageUrl": _imageUrlController.text,
                  "meaning": _meaningController.text,
                });
                Navigator.pop(context);
              },
              child: Text('Update Song'),
            ),
          ],
        ),
      ),
    );
  }
}
