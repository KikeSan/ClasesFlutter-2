import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return ChangeNotifierProvider(
      create: (_)=> new _MenuModel(),
      child: Scaffold(
        backgroundColor: (appTheme.darkTheme)?appTheme.currentTheme.scaffoldBackgroundColor:Colors.grey[200],
        //body: PinterestGrid(),
        //body: PinterestMenu(),
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation()
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context);

    if(widthPantalla>500){
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
        bottom: 30,
        child: Container(
          width: widthPantalla,
          child: Row(
            children: [
              Spacer(),
              PinterestMenu(
                mostrar: mostrar,
                activeColor: (appTheme.darkTheme)? appTheme.currentTheme.accentColor:Colors.red[800],
                inactiveColor: Colors.grey,
                backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
                items: [
                  PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie chart');}),
                  PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
                  PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon notifications');}),
                  PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');})
                ],
              ),
              Spacer(),
            ],
          ),
        )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      //print('Scrolllistener ${controller.offset}');
      if(controller.offset >scrollAnterior && controller.offset > 150){
        print('Ocultar Menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      }else{
        print('Mostrar Menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });
  }
  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = (MediaQuery.of(context).size.width>500)?3:2;
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.purple[600],
        borderRadius: BorderRadiusDirectional.all(Radius.circular(12))
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ));
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool value) {
    this._mostrar = value;
    notifyListeners();
  }
}