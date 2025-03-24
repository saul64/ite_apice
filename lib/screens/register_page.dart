import 'package:flutter/material.dart';
import 'package:ite_apice/providers/login_nav_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNavProvider>(
      builder:
          (context, value, child) => SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
              child: GestureDetector(
                onTap: () => value.updateIndex(0),
                child: Text("Regresar"),
              ),
            ),
          ),
    );
  }
}
