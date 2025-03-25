import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_button.dart';
import 'package:ite_apice/components/my_custom_input.dart';
import 'package:ite_apice/screens/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                //ignorar este contenedor
                width: double.infinity,
                height: altoPantalla * 0.0792682926829268,
                color: Color.fromARGB(255, 31, 75, 165),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: anchoPantalla * 0.121654501216545,
                ),
                width: double.infinity,
                height: altoPantalla * 0.8719512195121951,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: altoPantalla * 0.2926829268292683,

                      child: Image.asset(
                        "assets/images/logo.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: anchoPantalla * 0.072992700729927,
                          ),
                        ),
                        Text(
                          "¡Bienvenid@!",
                          style: TextStyle(
                            fontSize: anchoPantalla * 0.0583941605839416,
                            color: const Color.fromARGB(255, 108, 105, 105),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: altoPantalla * 0.0182926829268293),
                    MyCustomInput(
                      isTextHidden: false,
                      inputType: TextInputType.emailAddress,
                      iconRoute: "assets/icons/user.png",
                      inputLabel: "Correo institucional",
                      inputPlaceholder: "ejemplo@ite.edu.mx", controller: TextEditingController(),
                    ),
                    SizedBox(height: altoPantalla * 0.0426829268292683),
                    MyCustomInput(
                      isTextHidden: true,
                      inputType: TextInputType.visiblePassword,
                      iconRoute: "assets/icons/lock.png",
                      inputLabel: "Contraseña",
                      inputPlaceholder: "********", controller: TextEditingController(),
                    ),
                    SizedBox(height: altoPantalla * 0.0365853658536585),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,

                        child: Column(
                          children: [
                            MyCustomButton(textButton: "Iniciar sesión", onPressed: () {  },),
                            SizedBox(height: altoPantalla * 0.0365853658536585),
                            Text(
                              "¿Aún no tienes una cuenta?",

                              style: TextStyle(
                                fontSize: anchoPantalla * 0.0389294403892944,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  ),
                              child: SizedBox(
                                width: anchoPantalla * 0.364963503649635,
                                height: altoPantalla * 0.0609756097560976,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Regístrate",

                                      style: TextStyle(
                                        fontSize:
                                            anchoPantalla * 0.0389294403892944,
                                        color: Color.fromARGB(255, 31, 75, 165),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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