import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapatilla_model.dart';
import 'package:shoesapp/src/pages/zapatilla_desc_page.dart';
import 'package:shoesapp/src/pages/zapatilla_page.dart';

void main() {
  return runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> new ZapatillaModel())
        ],
          child: MyApp()
      )
  );
}

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
