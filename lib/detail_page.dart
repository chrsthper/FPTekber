import 'package:flutter/material.dart';
import 'song_meaning_page.dart';

class DetailPage extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final String lyrics;
  final String imageUrl;
  final String meaning;

  const DetailPage({
    Key? key,
    required this.songTitle,
    required this.artistName,
    required this.lyrics,
    required this.imageUrl,
    required this.meaning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Song Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the image
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[800],
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Song title and artist
            Text(
              songTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "by $artistName",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Song lyrics
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  lyrics,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // View Song Meaning button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongMeaningPage(
                      songTitle: songTitle,
                      meaning: meaning,
                    ),
                  ),
                );
              },
              child: Text("View Song Meaning"),
            ),
          ],
        ),
      ),
    );
  }
}
