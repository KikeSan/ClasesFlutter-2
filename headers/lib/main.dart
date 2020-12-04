import 'package:flutter/material.dart';
import 'package:headers/src/models/layout_model.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/launcher_page.dart';
import 'package:headers/src/pages/launcher_tablet_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/slideshow_page.dart';
import 'package:headers/src/pages/sliver_list_page.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';

/*void main() => runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger(1)),
          ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel()),
        ],
        child: MyApp()
    )
);*/
void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => new LayoutModel(),
      child: ChangeNotifierProvider(
        create: (_) => new ThemeChanger(1),
        child: MyApp()
      ),
    )
);

/*void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(1),
      child: MyApp()
    )
);*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation){
          final screenSize = MediaQuery.of(context).size;
          if(screenSize.width > 500){
            return LauncherTabletPage();
          }else{
            return LauncherPage();
          }

          /*print('Orientacion $orientation');
          return Container(
            child: LauncherPage()
          );*/
        },
      )
    );
  }
}
