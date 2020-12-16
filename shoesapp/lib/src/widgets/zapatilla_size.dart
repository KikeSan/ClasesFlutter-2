import 'package:flutter/material.dart';

class ZapatillaSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 410,
        decoration: BoxDecoration(
          color: Color(0xffffcf53),
          borderRadius: BorderRadius.circular(40)
        ),
        child: Column(
          children: [
            _ZapatillaConSombra(),
            _ZapatillaTallas()
          ],
        ),
      ),
    );
  }
}

class _ZapatillaTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatillaCaja(7),
          _TallaZapatillaCaja(7.5),
          _TallaZapatillaCaja(8),
          _TallaZapatillaCaja(8.5),
          _TallaZapatillaCaja(9),
          _TallaZapatillaCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatillaCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatillaCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('${numero.toString().replaceAll('.0', '')}',
        style: TextStyle(
          color: (this.numero==9)? Colors.white:Color(0xfff1a23a),
          fontSize: 16,
          fontWeight: FontWeight.bold,)),
      width: 45, height: 45,
      decoration: BoxDecoration(
        color: (this.numero==9)?Color(0xfff1a23a):Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(this.numero==9)
          BoxShadow(color: Color(0xfff1a23a),blurRadius: 10, offset: Offset(0,5))
        ]
      ),
    );
  }
}


class _ZapatillaConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 10, right: 0,
            child: _ZapatillaSombra()
          ),
          Image(image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}

class _ZapatillaSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffeaa14e),blurRadius: 40)
          ]
        ),
      ),
    );
  }
}
