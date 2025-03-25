import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_button.dart';
import 'package:ite_apice/components/small_button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    //411.42857142857144
    double anchoPantalla = MediaQuery.of(context).size.width;

    //820.5714285714286
    double altoPantalla = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //app bar xd
                width: double.infinity,
                height: altoPantalla * 0.0792682926829268,
                color: Color.fromARGB(255, 31, 75, 165),
              ),
              Container(
                //Father container
                padding: EdgeInsets.symmetric(
                  horizontal: anchoPantalla * 0.072992700729927,
                ),
                width: double.infinity,
                height: altoPantalla * 0.8719512195121951,
                //contenedor padre
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: altoPantalla * 0.1341463414634146,
                      child: Image.asset("assets/images/logo.jpg"),
                    ),
                    SizedBox(height: altoPantalla * 0.0121951219512195),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        anchoPantalla * 0.048661800486618,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: altoPantalla * 0.2804878048780488,
                        child: Image.asset(
                          "assets/images/about1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.0121951219512195),
                    Text(
                      "Cumple con tu servicio.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                    Text(
                      "Crece con tus prácticas.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                    Text(
                      "Destaca en tu residencia",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.0121951219512195),
                    Text(
                      "Tu camino profesional, empieza aquí",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        fontFamily: "Serif",
                      ),
                    ),
                    Container(
                      width: anchoPantalla * 0.364963503649635,
                      height: altoPantalla * 0.0609756097560976,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: anchoPantalla * 0.072992700729927,
                            height: altoPantalla * 0.0365853658536585,
                            child: Image.asset(
                              "assets/icons/circleblue.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            width: anchoPantalla * 0.072992700729927,
                            height: altoPantalla * 0.0365853658536585,
                            child: Image.asset("assets/icons/circle.png"),
                          ),
                          Container(
                            width: anchoPantalla * 0.072992700729927,
                            height: altoPantalla * 0.0365853658536585,
                            child: Image.asset("assets/icons/circle.png"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallButton(textButton: "Iniciar sesión"),
                        SmallButton(textButton: "Registrarse"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
