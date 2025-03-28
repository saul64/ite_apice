import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ite_apice/utils/validations.dart'; // Importa tu archivo de validaciones

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String? errorMessage;

  // Función para enviar el correo de recuperación
  void _resetPassword() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    String email = emailController.text;

    // Validación básica de correo electrónico
    if (email.isEmpty) {
      setState(() {
        errorMessage = 'Por favor, ingresa tu correo electrónico.';
      });
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Validación de formato de correo institucional ite
    if (!isValidEmail(email)) {
      setState(() {
        errorMessage = 'Por favor, ingresa un correo electrónico válido (ejemplo@ite.edu.mx).';
      });
      setState(() {
        isLoading = false;
      });
      return; // No enviar el correo si el formato no es válido
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Te hemos enviado un enlace para restablecer tu contraseña!')),
      );
      Navigator.pop(context); // Regresa a la página de login
    } catch (e) {
      setState(() {
        errorMessage = 'Hubo un error al enviar el correo de recuperación. Intenta nuevamente.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Recuperar Contraseña'),
          backgroundColor: Color(0xff042048),
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: anchoPantalla * 0.12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: altoPantalla * 0.2,
                  child: Image.asset("assets/images/logo.jpg", fit: BoxFit.fill),
                ),
                Text(
                  "Introduce tu correo electrónico para recuperar tu contraseña.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: anchoPantalla * 0.048,
                  ),
                ),
                SizedBox(height: altoPantalla * 0.03),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    hintText: 'ejemplo@ite.edu.mx',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: altoPantalla * 0.03),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                SizedBox(height: altoPantalla * 0.04),
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _resetPassword,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xff042048),
                          ),
                        ),
                        child: Text('Enviar correo de recuperación', style: TextStyle(color: Colors.white),),
                      ),
                SizedBox(height: altoPantalla * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Regresa a la página de login
                  },
                  child: Text(
                    "Volver al inicio de sesión",
                    style: TextStyle(
                      fontSize: anchoPantalla * 0.038,
                      color: const Color(0xff042048),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}