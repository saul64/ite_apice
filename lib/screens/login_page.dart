import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_button.dart';
import 'package:ite_apice/components/my_custom_input.dart';
import 'package:ite_apice/screens/register_page.dart';
import 'package:ite_apice/screens/post_logeo.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:ite_apice/screens/reset_password_page.dart';
import 'package:ite_apice/widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();

  void _onLoginPressed() async {
    String email = emailController.text;
    String password = passwordController.text;

    // iniciar sesión con Firebase
    User? user = await _firebaseService.loginUser(email, password);

    if (user != null) {
      // Si el inicio de sesión es exitoso, navega a la siguiente página
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inicio de sesión exitoso")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PostLogeo()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Correo o contraseña incorrectos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
                HeaderWidget(
                title: "Inicia sesión",
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: anchoPantalla * 0.12),
                width: double.infinity,
                height: altoPantalla * 0.87,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: altoPantalla * 0.29,
                      child: Image.asset("assets/images/logo.jpg", fit: BoxFit.fill),
                    ),
                    Text(
                      "¡Es genial tenerte de vuelta!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: anchoPantalla * 0.048,
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.018),
                    MyCustomInput(
                      controller: emailController,
                      isTextHidden: false,
                      inputType: TextInputType.emailAddress,
                      iconRoute: "assets/icons/user.png",
                      inputLabel: "Correo institucional",
                      inputPlaceholder: "ejemplo@ite.edu.mx",
                    ),
                    SizedBox(height: altoPantalla * 0.04),
                    MyCustomInput(
                      controller: passwordController,
                      isTextHidden: true,
                      inputType: TextInputType.visiblePassword,
                      iconRoute: "assets/icons/lock.png",
                      inputLabel: "Contraseña",
                      inputPlaceholder: "********",
                    ),
                    SizedBox(height: altoPantalla * 0.036),
                    MyCustomButton(
                      textButton: "Iniciar sesión",
                      onPressed: _onLoginPressed, // Llamar la función de login
                    ),
                    SizedBox(height: altoPantalla * 0.036),
                    Text(
                      "¿Aún no tienes una cuenta?",
                      style: TextStyle(
                        fontSize: anchoPantalla * 0.038,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      ),
                      child: SizedBox(
                        width: anchoPantalla * 0.36,
                        height: altoPantalla * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Regístrate",
                              style: TextStyle(
                                fontSize: anchoPantalla * 0.038,
                                color: const Color.fromARGB(255, 31, 75, 165),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: altoPantalla * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPasswordPage()), // Redirige a la página de recuperación
                        );
                      },
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          fontSize: anchoPantalla * 0.038,
                          color: const Color.fromARGB(255, 31, 75, 165),
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
    );
  }
}
