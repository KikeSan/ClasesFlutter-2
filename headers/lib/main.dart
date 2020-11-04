import 'package:flutter/material.dart';
import 'package:headers/src/pages/circular_progress_page.dart';
//import 'package:headers/src/retos/cuadrado_animado_page.dart';

import 'package:headers/src/pages/headers_page.dart';
//import 'src/pages/animaciones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: CircularProgressPage());
  }
}
