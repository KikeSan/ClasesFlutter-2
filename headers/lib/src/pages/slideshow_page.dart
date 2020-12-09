import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final primaryColor = appTheme.currentTheme.primaryColor;

    bool isLarge = (MediaQuery.of(context).size.height>500)?true:false;

    final children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow())
    ];

    return Scaffold(
      backgroundColor:(appTheme.darkTheme)?primaryColor:Colors.purple[50],
      body: (isLarge)
          ?Column(children: children)
          :Row(children: children)
    );
  }
}

class MiSlideshow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      //puntosArriba: true,
      colorPrimario: (appTheme.darkTheme) ? accentColor:Colors.purple,
      colorSecundario: Colors.purple[200],
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}