import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 15)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                height: 715,
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
                      height: 240,

                      child: Image.asset(
                        "assets/images/logo.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 30)),
                        Text(
                          "!Bienvenid@!",
                          style: TextStyle(
                            fontSize: 24,
                            color: const Color.fromARGB(255, 108, 105, 105),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset("assets/icons/user.png"),
                          ),
                          SizedBox(width: 25),
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
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: 20,
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
                    SizedBox(height: 35),
                    Container(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset("assets/icons/lock.png"),
                          ),
                          SizedBox(width: 25),
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
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: 20,
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
                                width: 230,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 31, 75, 165),

                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Iniciar sesión",

                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                "¿Aún no tienes una cuenta?",

                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Regístrate",

                                style: TextStyle(
                                  fontSize: 16,
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
