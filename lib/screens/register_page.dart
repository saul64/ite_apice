import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_button.dart';
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
                                GestureDetector(
                                  onTap: () => value.updateIndex(0),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          anchoPantalla * 0.048661800486618,
                                    ),

                                    width: anchoPantalla * 0.121654501216545,
                                    height: altoPantalla * 0.0609756097560976,
                                    child: Image.asset(
                                      "assets/icons/return.png",
                                    ),
                                  ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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

                                SizedBox(
                                  height: altoPantalla * 0.0182926829268293,
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color.fromARGB(
                                      255,
                                      31,
                                      75,
                                      165,
                                    ), // Fondo azul
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide
                                              .none, // Sin bordes externos
                                    ),
                                  ),
                                  dropdownColor: Color.fromARGB(
                                    255,
                                    31,
                                    75,
                                    165,
                                  ), // Color de la lista desplegable
                                  style: TextStyle(
                                    color: Colors.white,
                                  ), // Texto blanco
                                  hint: Text(
                                    "Selecciona tu carrera",
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ), // Color más tenue para el hint
                                  ),
                                  items:
                                      [
                                        "Ing. Sistemas Computacionales",
                                        "Ing. Industrial",
                                        "Ing. Electromecánica",
                                        "Ing. Mecatrónica",
                                        "Ing. Innovación Agrícola",
                                        "Lic. Gestión Empresarial",
                                      ].map((String carrera) {
                                        return DropdownMenuItem<String>(
                                          value: carrera,
                                          child: Text(
                                            carrera,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                  onChanged: (String? nuevaCarrera) {
                                    if (nuevaCarrera != null) {
                                      Future.delayed(
                                        Duration(milliseconds: 100),
                                        () {
                                          Scrollable.ensureVisible(context);
                                        },
                                      );
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: altoPantalla * 0.0182926829268293,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Desliza para llenar los campos ↓",
                                      style: TextStyle(
                                        fontSize:
                                            anchoPantalla * 0.0364963503649635,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: altoPantalla * 0.0182926829268293,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: altoPantalla * 0.3292682926829268,

                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        MyCustomInput(
                                          iconRoute: "assets/icons/user.png",
                                          inputLabel: "",
                                          inputPlaceholder: "Nombre",
                                        ),
                                        SizedBox(
                                          height:
                                              altoPantalla * 0.0060975609756098,
                                        ),
                                        MyCustomInput(
                                          iconRoute: "assets/icons/user.png",
                                          inputLabel: "",
                                          inputPlaceholder: "Apellido",
                                        ),
                                        SizedBox(
                                          height:
                                              altoPantalla * 0.0060975609756098,
                                        ),
                                        MyCustomInput(
                                          iconRoute: "assets/icons/email.png",
                                          inputLabel: "",
                                          inputPlaceholder:
                                              "Correo institucional",
                                        ),
                                        SizedBox(
                                          height:
                                              altoPantalla * 0.0060975609756098,
                                        ),
                                        MyCustomInput(
                                          iconRoute: "assets/icons/lock.png",
                                          inputLabel: "",
                                          inputPlaceholder: "Contraseña",
                                        ),
                                        SizedBox(
                                          height:
                                              altoPantalla * 0.0060975609756098,
                                        ),
                                        MyCustomInput(
                                          iconRoute: "assets/icons/lock.png",
                                          inputLabel: "",
                                          inputPlaceholder:
                                              "Confirmar contraseña",
                                        ),
                                        SizedBox(
                                          height:
                                              altoPantalla * 0.0182926829268293,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height:
                                              altoPantalla * 0.1219512195121951,

                                          child: Column(
                                            children: [
                                              Text(
                                                "Foto de perfil (opcional)",
                                                style: TextStyle(
                                                  fontSize:
                                                      anchoPantalla *
                                                      0.048661800486618,
                                                  color: const Color.fromARGB(
                                                    255,
                                                    131,
                                                    130,
                                                    130,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    anchoPantalla *
                                                    0.1654501216545012,

                                                height:
                                                    altoPantalla *
                                                    0.0838471023427867,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Color.fromARGB(
                                                    255,
                                                    184,
                                                    181,
                                                    181,
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  "assets/icons/addimage.png",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              altoPantalla * 0.0184956843403206,
                                        ),
                                        MyCustomButton(
                                          textButton: "Registrarse",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: altoPantalla * 0.0184956843403206,
                                ),
                                Text(
                                  "¿Ya tienes una cuenta?",

                                  style: TextStyle(
                                    fontSize:
                                        anchoPantalla * 0.0389294403892944,
                                    color: Color.fromARGB(255, 31, 75, 165),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => value.updateIndex(0),
                                  child: Text(
                                    "Inicia sesión",

                                    style: TextStyle(
                                      fontSize:
                                          anchoPantalla * 0.0389294403892944,
                                      color: Color.fromARGB(255, 31, 75, 165),
                                      fontWeight: FontWeight.bold,
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
            ),
          ),
    );
  }
}
