import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ite_apice/screens/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
