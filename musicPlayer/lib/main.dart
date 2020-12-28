import 'package:flutter/material.dart';
import 'package:musicPlayer/src/models/audio_player_model.dart';
import 'package:musicPlayer/src/pages/music_player_page.dart';
import 'package:musicPlayer/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>new AudioPlayerModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: miTema,
        home: MusicPlayerPage(),
      ),
    );
  }
}