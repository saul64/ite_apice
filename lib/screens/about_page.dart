import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ite_apice/components/about_one.dart';
import 'package:ite_apice/components/about_three.dart';
import 'package:ite_apice/components/about_two.dart';
import 'package:ite_apice/components/small_button.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reinicia al principio
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Detener el temporizador cuando la pantalla se cierre
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 411.42857142857144
    double anchoPantalla = MediaQuery.of(context).size.width;

    // 820.5714285714286
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
                        height: altoPantalla * 0.4878048780487805,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          children: [
                            // Aquí defines las pantallas con las imágenes
                            AboutOne(),
                            AboutTwo(),
                            AboutThree(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.0121951219512195),
                    // Los puntitos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal: anchoPantalla * 0.0121654501216545,
                          ),
                          width:
                              _currentPage == index
                                  ? 12
                                  : 8, // Cambia de tamaño el punto activo
                          height: _currentPage == index ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentPage == index
                                    ? Color.fromARGB(
                                      255,
                                      31,
                                      75,
                                      165,
                                    ) // Color activo
                                    : Colors.grey, // Color inactivo
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: altoPantalla * 0.0609756097560976),
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
