import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ite_apice/providers/login_nav_provider.dart';
import 'package:ite_apice/screens/login_page.dart';
import 'package:ite_apice/screens/register_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginNavProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNavProvider>(
      builder:
          (context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: _IndiceSeleccionado(instancia: value),
          ),
    );
  }
}

class _IndiceSeleccionado extends StatelessWidget {
  final LoginNavProvider instancia;
  _IndiceSeleccionado({required this.instancia, super.key});

  @override
  Widget build(BuildContext context) {
    switch (instancia.pageIndex) {
      case 0:
        return LoginPage();
      case 1:
        return RegisterPage();
      default:
        return LoginPage();
    }
  }
}
