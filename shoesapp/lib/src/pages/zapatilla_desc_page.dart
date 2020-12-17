import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatillaDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ZapatillaSizePreview(fullscreen:true),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                ),
                _MontoByNow(),
              ],
            ),
          ))
        ],
      )
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
            BotonNaranja(texto: 'Buy Now',ancho: 120,alto: 40,)
          ],
        ),
      ),
    );
  }
}