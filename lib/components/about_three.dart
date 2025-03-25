import 'package:flutter/material.dart';

class AboutThree extends StatelessWidget {
  const AboutThree({super.key});

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
            child: Image.asset("assets/images/about3.jpg", fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: altoPantalla * 0.0121951219512195),
        Text(
          textAlign: TextAlign.center,
          "Sé el primero en enterarte de nuevas oportunidades que encajen contigo.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: "Times New Roman",
          ),
        ),

        SizedBox(height: altoPantalla * 0.0121951219512195),
        Text(
          "Impulsa tu futuro desde hoy",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            fontFamily: "Serif",
          ),
        ),
      ],
    );

    //820.5714285714286
  }
}
