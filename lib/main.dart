import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ite_apice/screens/about_page.dart';

import 'package:ite_apice/screens/login_page.dart';
import 'package:ite_apice/screens/register_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => AboutPage(),
        '/registerPage': (context) => RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
