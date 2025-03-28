import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ite_apice/utils/validations.dart';
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
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? _selectedCarrera;

  // Variables de estado para los errores
  String? nombreError;
  String? apellidoError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  String? carreraError;

  final FirebaseService _firebaseService = FirebaseService();
  void validatePassword() {
    setState(() {
      passwordError = null; // Limpiar el mensaje de error anterior
    });

    String password = passwordController.text;

    if (password.contains(' ')) {
      setState(() {
        passwordError = "La contraseña no debe contener espacios en blanco.";
      });
      return;
    }
    // Verificar la longitud
    if (password.length < 8 || password.length > 12) {
      setState(() {
        passwordError = "La contraseña debe tener entre 8 y 12 caracteres.";
      });
      return;
    }

    // Verificar si tiene una mayúscula
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      setState(() {
        passwordError =
            "La contraseña debe contener al menos una letra mayúscula.";
      });
      return;
    }

    if (!RegExp(r'(?=.*[@#$%^&+=!])').hasMatch(password)) {
      setState(() {
        passwordError =
            "La contraseña debe contener al menos un carácter especial como @, #, %, ^, & o +";
      });
      return;
    }
  }

  void _onRegisterPressed() async {
    // Limpiar errores previos
    setState(() {
      nombreError = null;
      apellidoError = null;
      emailError = null;
      passwordError = null;
      confirmPasswordError = null;
      carreraError = null;
    });

    // Eliminar espacios en blanco al inicio y final
    String nombre = nombreController.text.trim().replaceAll(
      RegExp(r'\s+'),
      ' ',
    );
    String apellido = apellidoController.text.trim().replaceAll(
      RegExp(r'\s+'),
      ' ',
    );
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Validar que el nombre no tenga espacios extra ni caracteres no deseados
    if (!isValidFirstName(nombre)) {
      setState(() {
        nombreError =
            "El nombre no puede tener espacios extra ni caracteres especiales.";
      });
      return;
    }

    // Validar que el apellido no tenga espacios extra ni caracteres no deseados
    if (!isValidLastName(apellido)) {
      setState(() {
        apellidoError =
            "El apellido no puede tener espacios extra ni caracteres especiales.";
      });
      return;
    }

    // Validar que el nombre no sea vacío
    if (nombre.isEmpty) {
      setState(() {
        nombreError = "Nombre es requerido";
      });
      return;
    }

    // Validar que el apellido no sea vacío
    if (apellido.isEmpty) {
      setState(() {
        apellidoError = "Apellido es requerido";
      });
      return;
    }

    // Validar que el nombre y apellido sean válidos
    if (!isValidFirstName(nombre)) {
      setState(() {
        nombreError = "Nombre inválido";
      });
      return;
    }

    if (!isValidLastName(apellido)) {
      setState(() {
        apellidoError = "Apellido inválido";
      });
      return;
    }

    // Validar que las contraseñas coinciden
    if (password != confirmPassword) {
      setState(() {
        confirmPasswordError = "Las contraseñas no coinciden";
      });
      return;
    }

    // Validar el correo electrónico
    if (!isValidEmail(email)) {
      setState(() {
        if (email.contains(' ')) {
          emailError =
              "El correo electrónico no puede contener espacios en blanco.";
        }
        emailError =
            "El correo electrónico debe seguir el formato 'al<8 dígitos>@ite.edu.mx'.";
      });
      return;
    }

    // Llamar a la función de validación de la contraseña
    validatePassword();

    // Si hay un error de contraseña, salir de la función
    if (passwordError != null) {
      return;
    }

    // Validar que se seleccione una carrera
    if (_selectedCarrera == null) {
      setState(() {
        carreraError = "Por favor selecciona una carrera";
      });
      return;
    }

    // Registrar usuario con valores limpios
    User? user = await _firebaseService.registerUser(
      email,
      password,
      nombre,
      apellido,
      _selectedCarrera ?? '',
    );

    if (user != null) {
      // Mostrar mensaje de éxito
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.all(20),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 30),
                SizedBox(width: 10),
                Text("Registro exitoso", style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/loginPage');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("El correo ya está registrado o error al registrar"),
        ),
      );
    }
  }

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
              HeaderWidget(title: "Registrate"),
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
                          carreraError =
                              null; // Limpiar error si se selecciona una carrera
                        });
                      },
                    ),
                    if (carreraError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          carreraError!,
                          style: TextStyle(color: Colors.red),
                        ),
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
                      nombreController: nombreController,
                      apellidoController: apellidoController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      selectedCarrera: _selectedCarrera,
                      onRegisterPressed: _onRegisterPressed,
                      nombreError: nombreError,
                      apellidoError: apellidoError,
                      emailError: emailError,
                      passwordError: passwordError,
                      confirmPasswordError: confirmPasswordError,
                    ),
                    SizedBox(height: altoPantalla * 0.0182926829268293),
                    Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(
                        fontSize: anchoPantalla * 0.0389294403892944,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/loginPage"),
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
                                color: Color(0xff042048),
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
