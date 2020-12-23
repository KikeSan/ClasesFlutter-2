import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapatilla_model.dart';
import 'package:shoesapp/src/pages/zapatilla_desc_page.dart';

class ZapatillaSizePreview extends StatelessWidget {
  final bool fullscreen;

  ZapatillaSizePreview({
    this.fullscreen = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!this.fullscreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ZapatillaDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: this.fullscreen?5: 30,
            vertical: this.fullscreen?5: 0
        ),
        child: Container(
          width: double.infinity,
          height: this.fullscreen ?384:430,
          decoration: BoxDecoration(
            color: Color(0xffffcf53),
            borderRadius: !fullscreen
                ? BorderRadius.circular(40)
                : BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50),topLeft: Radius.circular(30),topRight: Radius.circular(30))
          ),
          child: Column(
            children: [
              _ZapatillaConSombra(),
              if(!this.fullscreen)
                _ZapatillaTallas()
            ],
          ),
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

    final zapatillaModel = Provider.of<ZapatillaModel>(context);

    return GestureDetector(
      onTap: (){
        final zapatillaModel = Provider.of<ZapatillaModel>(context, listen: false);
        zapatillaModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (this.numero==zapatillaModel.talla)? Colors.white:Color(0xfff1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold,)),
        width: 45, height: 45,
        decoration: BoxDecoration(
          color: (this.numero==zapatillaModel.talla)?Color(0xfff1a23a):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numero==zapatillaModel.talla)
            BoxShadow(color: Color(0xfff1a23a),blurRadius: 10, offset: Offset(0,5))
          ]
        ),
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
