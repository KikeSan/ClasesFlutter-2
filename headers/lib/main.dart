import 'package:flutter/material.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/slideshow_page.dart';
import 'package:headers/src/pages/sliver_list_page.dart';

//import 'package:headers/src/pages/graficas_circulares_page.dart';
//import 'file:///D:/KIKE/GIT/flutter/ClasesFlutter-2/headers/lib/src/labs/circular_progress_page.dart';
//import 'package:headers/src/retos/cuadrado_animado_page.dart';

//import 'package:headers/src/pages/headers_page.dart';
//import 'src/pages/animaciones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: SliverListPage());
  }
}
