import 'package:flutter/material.dart';
import 'add_song_page.dart';
import 'detail_page.dart';
import 'about_page.dart';
import 'edit_song_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> songs = [
    {
      "title": "Blackbird",
      "artist": "The Beatles",
      "lyrics": """
Blackbird singing in the dead of night
Take these broken wings and learn to fly
""",
      "imageUrl": "https://upload.wikimedia.org/wikipedia/en/a/a1/Beatles_blackbird.jpg",
      "meaning": "Inspired by the civil rights movement in America."
    },
    {
      "title": "Blinding Lights",
      "artist": "The Weeknd",
      "lyrics": """
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
""",
      "imageUrl": "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_Blinding_Lights.png",
      "meaning": "A longing for love wrapped in '80s synth-pop vibes."
    },
  ];

  // Function to add a new song
  void addSong(Map<String, String> newSong) {
    setState(() {
      songs.add(newSong);
    });
  }

  // Function to delete a song
  void deleteSong(int index) {
    setState(() {
      songs.removeAt(index);
    });
  }

  // Function to update an existing song
  void updateSong(int index, Map<String, String> updatedSong) {
    setState(() {
      songs[index] = updatedSong;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lovetify',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1DB954), // Spotify green
        onPressed: () async {
          final newSong = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSongPage()),
          );
          if (newSong != null) {
            addSong(newSong);
          }
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.music_note,
                  color: Color(0xFF1DB954),
                  size: 32,
                ),
                title: Text(
                  songs[index]['title']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                subtitle: Text(
                  songs[index]['artist']!,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () async {
                        final updatedSong = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditSongPage(
                              song: songs[index],
                              onUpdateSong: (updatedSong) => updateSong(index, updatedSong),
                            ),
                          ),
                        );
                        if (updatedSong != null) {
                          updateSong(index, updatedSong);
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteSong(index),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        songTitle: songs[index]['title']!,
                        artistName: songs[index]['artist']!,
                        lyrics: songs[index]['lyrics']!,
                        imageUrl: songs[index]['imageUrl']!,
                        meaning: songs[index]['meaning']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
