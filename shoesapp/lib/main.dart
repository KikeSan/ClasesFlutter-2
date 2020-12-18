import 'package:flutter/material.dart';
import 'package:shoesapp/src/pages/zapatilla_desc_page.dart';
import 'package:shoesapp/src/pages/zapatilla_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ZapatillaPage(),
      //home: ZapatillaDescPage(),
    );
  }
}
