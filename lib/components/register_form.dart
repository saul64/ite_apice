import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_button.dart';
import 'package:ite_apice/components/my_custom_input.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nombreController;
  final TextEditingController apellidoController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? selectedCarrera;
  final Function onRegisterPressed;

  // Variables de error
  final String? nombreError;
  final String? apellidoError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  const RegisterForm({
    Key? key,
    required this.nombreController,
    required this.apellidoController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.selectedCarrera,
    required this.onRegisterPressed,
    this.nombreError,
    this.apellidoError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: altoPantalla * 0.3170731707317073,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyCustomInput(
              controller: nombreController,
              isTextHidden: false,
              inputType: TextInputType.name,
              iconRoute: "assets/icons/user.png",
              inputLabel: "Nombre",
              inputPlaceholder: "Nombre",
            ),
            if (nombreError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  nombreError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: apellidoController,
              isTextHidden: false,
              inputType: TextInputType.name,
              iconRoute: "assets/icons/user.png",
              inputLabel: "Apellido",
              inputPlaceholder: "Apellido",
            ),
            if (apellidoError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  apellidoError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: emailController,
              isTextHidden: false,
              inputType: TextInputType.emailAddress,
              iconRoute: "assets/icons/email.png",
              inputLabel: "Correo Institucional",
              inputPlaceholder: "Correo institucional",
            ),
            if (emailError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  emailError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: passwordController,
              isTextHidden: true,
              inputType: TextInputType.text,
              iconRoute: "assets/icons/lock.png",
              inputLabel: "Contraseña",
              inputPlaceholder: "Contraseña",
            ),
            if (passwordError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  passwordError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: confirmPasswordController,
              isTextHidden: true,
              inputType: TextInputType.text,
              iconRoute: "assets/icons/lock.png",
              inputLabel: "Confirmar Contraseña",
              inputPlaceholder: "Confirmar contraseña",
            ),
            if (confirmPasswordError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  confirmPasswordError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: altoPantalla * 0.0182926829268293),
            MyCustomButton(
              textButton: "Registrarse",
              onPressed: () {
                  onRegisterPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}
