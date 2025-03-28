import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ite_apice/firebase_options.dart';
import 'package:ite_apice/screens/about_page.dart';
import 'package:ite_apice/screens/login_page.dart';
import 'package:ite_apice/screens/register_page.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proveedor de ActividadProvider para manejar las actividades
        ChangeNotifierProvider(create: (_) => ActividadProvider()), 
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => AboutPage(),
          '/registerPage': (context) => RegisterPage(),
          '/loginPage': (context) => LoginPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}