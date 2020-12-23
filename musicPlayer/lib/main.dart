import 'package:flutter/material.dart';
import 'package:musicPlayer/src/pages/music_player_page.dart';
import 'package:musicPlayer/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: miTema,
      home: MusicPlayerPage(),
    );
  }
}