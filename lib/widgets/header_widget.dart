//header de la pantalla, se puede reutilizar en todas las pantallas
// components/header_widget.dart
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final Function onBackPressed;

  const HeaderWidget({
    Key? key,
    required this.title,
    required this.onBackPressed,
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
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: anchoPantalla * 0.048661800486618,
              ),
              width: anchoPantalla * 0.121654501216545,
              height: altoPantalla * 0.0609756097560976,
              child: Image.asset("assets/icons/return.png"),
            ),
          ),
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
