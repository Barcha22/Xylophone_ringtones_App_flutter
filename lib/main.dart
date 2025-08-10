import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent, //
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
                Text(
                  'Xylophone Tunes', //
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Icon(Icons.music_note),
              ],
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: XyloApp(),
      ),
    ),
  );
}

class XyloApp extends StatefulWidget {
  const XyloApp({super.key});

  @override
  State<XyloApp> createState() => _XyloAppState();
}

class _XyloAppState extends State<XyloApp> {
  //first make an object
  final player = AudioPlayer();

  //then make a list of colors for the buttonss
  final List<Color> buttonColors = [
    Colors.white,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.grey,
    Colors.lightBlueAccent,
    Colors.deepPurpleAccent,
    Colors.black,
  ];

  //then make the funtion to prevent memory leaks/destructor
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  //after that make a function to playSounds
  void playNote(int noteNum) async {
    try {
      await player.play(AssetSource('note$noteNum.wav'));
    } catch (e) {
      debugPrint('Audio playing error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i <= 7; i++)
          Expanded(
            child: Center(
              child: Container(
                height: 50,
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: buttonColors[i - 1], //
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  onPressed: () {
                    playNote(i);
                  }, //
                  child: Text('Note $i'),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
