import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatillaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(texto: 'For You'),
          SizedBox(height: 20),
          ZapatillaSizePreview()
        ],
      ),
      //body: CustomAppBar(texto: 'For you'),
    );
  }
}
