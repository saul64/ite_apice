import 'package:flutter/material.dart';

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
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: altoPantalla * 0.0182926829268293,
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
                  border: Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: altoPantalla * 0.048780487804878),
                    Container(
                      width: double.infinity,
                      height: altoPantalla * 0.0975609756097561,
                      child: Row(
                        children: [
                          Container(
                            width: anchoPantalla * 0.121654501216545,
                            height: altoPantalla * 0.0609756097560976,
                            child: Image.asset("assets/icons/user.png"),
                          ),
                          SizedBox(width: anchoPantalla * 0.0608272506082725),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Correo institucional:",

                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          anchoPantalla * 0.048661800486618,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize:
                                              anchoPantalla * 0.048661800486618,
                                          color: const Color.fromARGB(
                                            255,
                                            131,
                                            130,
                                            130,
                                          ),
                                        ),

                                        hintText: "ejemplo@ite.edu.mx",
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Colors
                                                    .black, // Cambia el color de la línea a negro
                                            width:
                                                2.0, // Ajusta el ancho de la línea
                                          ),
                                        ),
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
                    SizedBox(height: altoPantalla * 0.0426829268292683),
                    Container(
                      width: double.infinity,
                      height: altoPantalla * 0.0975609756097561,
                      child: Row(
                        children: [
                          Container(
                            width: anchoPantalla * 0.121654501216545,
                            height: altoPantalla * 0.0609756097560976,
                            child: Image.asset("assets/icons/lock.png"),
                          ),
                          SizedBox(width: anchoPantalla * 0.0608272506082725),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contraseña:",

                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          anchoPantalla * 0.048661800486618,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize:
                                              anchoPantalla * 0.048661800486618,
                                          color: const Color.fromARGB(
                                            255,
                                            131,
                                            130,
                                            130,
                                          ),
                                        ),
                                        hintText: "********",
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Colors
                                                    .black, // Cambia el color de la línea a negro
                                            width:
                                                2.0, // Ajusta el ancho de la línea
                                          ),
                                        ),
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
                    SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,

                          child: Column(
                            children: [
                              Container(
                                width: anchoPantalla * 0.5596107055961071,
                                height: altoPantalla * 0.0548780487804878,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 31, 75, 165),

                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Iniciar sesión",

                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          anchoPantalla * 0.0437956204379562,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: altoPantalla * 0.0365853658536585,
                              ),
                              Text(
                                "¿Aún no tienes una cuenta?",

                                style: TextStyle(
                                  fontSize: anchoPantalla * 0.0389294403892944,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Regístrate",

                                style: TextStyle(
                                  fontSize: anchoPantalla * 0.0389294403892944,
                                  color: Color.fromARGB(255, 31, 75, 165),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
