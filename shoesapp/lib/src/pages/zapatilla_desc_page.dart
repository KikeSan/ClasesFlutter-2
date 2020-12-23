import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapatilla_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatillaDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
              children: [
                Hero(
                    tag: 'zapatilla-1',
                    child: ZapatillaSizePreview(fullscreen:true)
                ),
                Positioned(
                  top: 40,
                  child: FloatingActionButton(
                    child: Icon(Icons.chevron_left, color: Colors.white,size: 60,),
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                )
              ]
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                ),
                _MontoByNow(),
                _ColoresYMas(),
                _BotonesLikeCartSettings()
              ],
            ),
          ))
        ],
      )
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.favorite, color: Colors.red,size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey[600].withOpacity(0.4),size: 25)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey[600].withOpacity(0.4),size: 25))
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(
          color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0,10)
        )]
      ),
    );
  }
}

class _ColoresYMas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left:90,child:_BotonColor(Color(0xffc6d642),3,'assets/imgs/verde.png')),
                Positioned(left:60,child:_BotonColor(Color(0xffffad29),2,'assets/imgs/amarillo.png')),
                Positioned(left:30,child:_BotonColor(Color(0xff2099f1),1,'assets/imgs/azul.png')),
                _BotonColor(Color(0xff364d56),0,'assets/imgs/negro.png'),
              ],
            )),
          //Spacer(),
          BotonNaranja(texto: 'More related items', alto: 30,ancho: 170,color: Color(0xffffc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  _BotonColor(
    this.color,
    this.index,
    this.urlImagen
  );

  @override
  Widget build(BuildContext context) {
    return ElasticInLeft(
      delay: Duration(milliseconds: this.index*100),
      duration: Duration(milliseconds: 1300),
      child: GestureDetector(
        onTap: (){
          final zapatillaModel = Provider.of<ZapatillaModel>(context, listen: false);
          zapatillaModel.assetImage = this.urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoByNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Text('\$180.0',style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Buy Now',ancho: 120,alto: 40,)
            )
          ],
        ),
      ),
    );
  }
}