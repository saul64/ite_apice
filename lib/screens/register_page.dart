import 'package:flutter/material.dart';
import 'package:ite_apice/widgets/header_widget.dart';
import 'package:ite_apice/components/register_form.dart';
import 'package:ite_apice/components/carrera_dropdown.dart';
import 'package:ite_apice/services/firebase_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _selectedCarrera;

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                title: "Registro",
                onBackPressed: () => Navigator.pop(context),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: anchoPantalla * 0.121654501216545,
                ),
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: altoPantalla * 0.2926829268292683,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: altoPantalla * 0.2073170731707317,
                            child: Image.asset("assets/images/logo.jpg"),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: anchoPantalla * 0.048661800486618,
                            ),
                            "Tu futuro profesional empieza con un registro. ¡Únete hoy!",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.0182926829268293),
                    CarreraDropdown(
                      selectedCarrera: _selectedCarrera,
                      onChanged: (String? nuevaCarrera) {
                        setState(() {
                          _selectedCarrera = nuevaCarrera;
                        });
                      },
                    ),
                    SizedBox(height: altoPantalla * 0.0182926829268293),
                    Text(
                      "Por favor llena los siguientes campos:",

                      style: TextStyle(
                        fontSize: anchoPantalla * 0.0389294403892944,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.0182926829268293),
                    RegisterForm(
                      nombreController: _nombreController,
                      apellidoController: _apellidoController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      selectedCarrera: _selectedCarrera,
                      onRegisterPressed: () {
                        if (_nombreController.text.isEmpty ||
                            _apellidoController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _confirmPasswordController.text.isEmpty ||
                            _selectedCarrera == null ||
                            _selectedCarrera!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Todos los campos son obligatorios",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Las contraseñas no coinciden"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        registerUser(
                              _nombreController.text,
                              _apellidoController.text,
                              _emailController.text,
                              _passwordController.text,
                              _selectedCarrera ?? "",
                            )
                            .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Usuario registrado con éxito"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            })
                            .catchError((e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Error al registrar usuario: $e",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });
                      },
                    ),
                    SizedBox(height: 15),
                    Text(
                      "¿Ya tienes una cuenta?",

                      style: TextStyle(
                        fontSize: anchoPantalla * 0.0389294403892944,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        width: anchoPantalla * 0.364963503649635,
                        height: altoPantalla * 0.0365853658536585,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Inicia sesión",

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
