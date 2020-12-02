import 'package:flutter/material.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/launcher_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/slideshow_page.dart';
import 'package:headers/src/pages/sliver_list_page.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(1),
      child: MyApp()
    )
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage());
  }
}
