import 'package:flutter/material.dart';

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
                //father container
                color: Colors.orange,
                padding: EdgeInsets.symmetric(
                  horizontal: anchoPantalla * 0.121654501216545,
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
                    Container(
                      width: double.infinity,
                      height: altoPantalla * 0.2804878048780488,
                      child: Image.asset("assets/images/about1.jpg"),
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
