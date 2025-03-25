import 'package:flutter/material.dart';

class AboutOne extends StatelessWidget {
  const AboutOne({super.key});

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            anchoPantalla * 0.048661800486618,
          ),
          child: Container(
            width: double.infinity,
            height: altoPantalla * 0.2804878048780488,
            child: Image.asset("assets/images/about1.jpg", fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: altoPantalla * 0.0121951219512195),
        Text(
          "Cumple con tu servicio.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: anchoPantalla * 0.0583941605839416,
            fontFamily: "Times New Roman",
          ),
        ),
        Text(
          "Crece con tus prácticas.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: anchoPantalla * 0.0583941605839416,
            fontFamily: "Times New Roman",
          ),
        ),
        Text(
          "Destaca en tu residencia",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: anchoPantalla * 0.0583941605839416,
            fontFamily: "Times New Roman",
          ),
        ),
        SizedBox(height: altoPantalla * 0.0121951219512195),
        Text(
          "Tu camino profesional, empieza aquí",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: anchoPantalla * 0.0340632603406326,
            fontFamily: "Serif",
          ),
        ),
      ],
    );

    //820.5714285714286
  }
}
