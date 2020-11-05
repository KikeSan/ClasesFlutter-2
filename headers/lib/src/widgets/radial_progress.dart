import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;


  RadialProgress({ this.porcentaje });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior=widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 20));

    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child){
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress( (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value) ),
            ),
          );
        }
    );
  }
}


class _MiRadialProgress extends CustomPainter{
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {



    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.black12
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width*0.5, size.height/2);
    final radio = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent[700]
      ..style = PaintingStyle.stroke;

    //parte q se va llenando
    double arcAngle = 2*pi*(porcentaje/100);
    canvas.drawArc(
        Rect.fromCircle(center: center,radius: radio),
        -pi/2,
        arcAngle,
        false,
        paintArco);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

