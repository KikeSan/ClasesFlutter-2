import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;

  PinterestMenu({this.mostrar = true});

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie chart');}),
    PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
    PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon notifications');}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');}),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _MenuModel(),
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: (mostrar)?1:0,
          child: _PinterestMenuBackground(
            child: _MenuItems(items)),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({@required this.child});

  //final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5 //contrae la sombra
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  _PinterestMenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
      },
      behavior: HitTestBehavior.translucent, //compatible con todos los móviles
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado==index) ? 35 : 25,
          color: (itemSeleccionado==index) ? Colors.red[800] : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int value) {
    _itemSeleccionado = value;
    notifyListeners();
  }
}