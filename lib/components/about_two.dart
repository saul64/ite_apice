import 'package:flutter/material.dart';

class AboutTwo extends StatelessWidget {
  const AboutTwo({super.key});

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
            child: Image.asset("assets/images/about2.jpg", fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: altoPantalla * 0.0121951219512195),
        Text(
          textAlign: TextAlign.center,
          "Encuentra ofertas de servicio social, prácticas y residencias",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: anchoPantalla * 0.0535279805352798,
            fontFamily: "Times New Roman",
          ),
        ),

        SizedBox(height: altoPantalla * 0.0121951219512195),
        Text(
          textAlign: TextAlign.center,
          "¿No sabes dónde hacer tu servicio social?\nNosotros te ayudamos",
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
