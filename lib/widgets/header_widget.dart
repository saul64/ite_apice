//header de la pantalla, se puede reutilizar en todas las pantallas
// components/header_widget.dart
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return Container(
      color: Color.fromARGB(255, 31, 75, 165),
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
