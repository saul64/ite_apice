//formulario de registro de usuario
// components/register_form.dart
import 'package:flutter/material.dart';
import 'package:ite_apice/components/my_custom_button.dart';
import 'package:ite_apice/components/my_custom_input.dart';
import 'package:ite_apice/services/firebase_service.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nombreController;
  final TextEditingController apellidoController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? selectedCarrera;
  final Function onRegisterPressed;

  const RegisterForm({
    Key? key,
    required this.nombreController,
    required this.apellidoController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.selectedCarrera,
    required this.onRegisterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
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
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: apellidoController,
              isTextHidden: false,
              inputType: TextInputType.name,
              iconRoute: "assets/icons/user.png",
              inputLabel: "Apellido",
              inputPlaceholder: "Apellido",
            ),
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: emailController,
              isTextHidden: false,
              inputType: TextInputType.emailAddress,
              iconRoute: "assets/icons/email.png",
              inputLabel: "Correo",
              inputPlaceholder: "Correo institucional",
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
            SizedBox(height: altoPantalla * 0.0060975609756098),
            MyCustomInput(
              controller: confirmPasswordController,
              isTextHidden: true,
              inputType: TextInputType.text,
              iconRoute: "assets/icons/lock.png",
              inputLabel: "Confirmar Contraseña",
              inputPlaceholder: "Confirmar contraseña",
            ),
            SizedBox(height: altoPantalla * 0.0182926829268293),
            // Botón de registro
            MyCustomButton(
              textButton: "Registrarse",
              onPressed: () {
                if (passwordController.text == confirmPasswordController.text) {
                  onRegisterPressed();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Las contraseñas no coinciden")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
