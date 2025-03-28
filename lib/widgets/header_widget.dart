//header de la pantalla, se puede reutilizar en todas las pantallas
// components/header_widget.dart
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return Container(
      color: Color(0xff042048),
      width: double.infinity,
      height: altoPantalla * 0.0792682926829268,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: anchoPantalla * 0.0535279805352798,
            ),
          ),
        ],
      ),
    );
  }
}
