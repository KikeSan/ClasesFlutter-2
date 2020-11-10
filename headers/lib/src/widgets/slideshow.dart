import 'package:flutter/material.dart';
//import 'package:headers/src/models/slider_model.dart';
import 'package:provider/provider.dart';

//import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    @required this.slides,
    this.puntosArriba     = false,
    this.colorPrimario    = Colors.blue,
    this.colorSecundario  = Colors.black26,
    this.bulletPrimario   = 12,
    this.bulletSecundario = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlidershowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context){
              Provider.of<_SlidershowModel>(context).colorPrimario = this.colorPrimario;
              Provider.of<_SlidershowModel>(context).colorSecundario = this.colorSecundario;
              Provider.of<_SlidershowModel>(context).bulletPrimario = this.bulletPrimario;
              Provider.of<_SlidershowModel>(context).bulletSecundario = this.bulletSecundario;
              return _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
            },
          ),
      ),
    ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(this.puntosArriba)
          _Dots(this.slides.length),
        Expanded(
            child: _Slides(this.slides)),
        if(!this.puntosArriba)
          _Dots(this.slides.length),

      ],
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  _Dots(this.totalSlides);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        /*children: [
          _Dot(0),
          _Dot(1),
          _Dot(2)
        ],*/
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    //final pageViewIndex = Provider.of<_SlidershowModel>(context).currentPage;
    final ssModel = Provider.of<_SlidershowModel>(context);
    double tamanoBullet;
    Color colorBullet;

    if(ssModel.currentPage>=index-0.5 && ssModel.currentPage<index+0.5){
      tamanoBullet = ssModel.bulletPrimario;
      colorBullet = ssModel.colorPrimario;
    }else{
      tamanoBullet = ssModel.bulletSecundario;
      colorBullet = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamanoBullet,
      height: tamanoBullet,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color:colorBullet,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlidershowModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }
  @override
  void dispose(){
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: PageView(
        controller: pageViewController,
        /*children: <Widget>[
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),
        ],*/
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: this.slide,
    );
  }
}


class _SlidershowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double _bulletPrimario = 12;
  double _bulletSecundario = 12;


  double get currentPage => this._currentPage;

  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color value) {
    this._colorPrimario = value;
    //notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color value) {
    this._colorSecundario = value;
    //notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double value) {
    this._bulletPrimario = value;
    //notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double value) {
    this._bulletSecundario = value;
    //notifyListeners();
  }


}

