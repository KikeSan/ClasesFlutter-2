import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/boton_naranja.dart';
class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  AgregarCarritoBoton({this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [
            SizedBox(width: 30),
            Text('\$$monto',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            BotonNaranja(texto: 'ADD TO CART'),
            SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
