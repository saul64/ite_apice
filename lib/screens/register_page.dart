import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_input.dart';
import 'package:ite_apice/providers/login_nav_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //411.42857142857144
    double anchoPantalla = MediaQuery.of(context).size.width;

    //820.5714285714286
    double altoPantalla = MediaQuery.of(context).size.height;
    return Consumer<LoginNavProvider>(
      builder:
          (context, value, child) => SafeArea(
            child: Consumer<LoginNavProvider>(
              builder:
                  (context, value, child) => Scaffold(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 31, 75, 165),
                            width: double.infinity,
                            height: altoPantalla * 0.0792682926829268,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        anchoPantalla * 0.048661800486618,
                                  ),

                                  width: anchoPantalla * 0.121654501216545,
                                  height: altoPantalla * 0.0609756097560976,
                                  child: Image.asset("assets/icons/return.png"),
                                ),

                                Text(
                                  "Registro",
                                  style: TextStyle(
                                    color: Colors.white,

                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        anchoPantalla * 0.0535279805352798,
                                  ),
                                ),
                              ],
                            ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: altoPantalla * 0.2926829268292683,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            altoPantalla * 0.2073170731707317,

                                        child: Image.asset(
                                          "assets/images/logo.jpg",
                                        ),
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              anchoPantalla * 0.048661800486618,
                                        ),
                                        "Tu futuro profesional empieza con un registro. ¡Únete hoy!",
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
    );
  }
}
