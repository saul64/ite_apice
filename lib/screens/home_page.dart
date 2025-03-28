import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ite_apice/components/bottom_navigation_bar.dart';
import 'package:ite_apice/models/user_cache.dart'; // Asegúrate de importar tu caché de usuario
import 'package:ite_apice/screens/my_profile_page.dart';
import 'package:ite_apice/screens/my_saves_page.dart';
import 'package:ite_apice/screens/services_offers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectecIndex = 1;
  DateTime? _lastPressedTime;

  // Función para cerrar sesión
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut(); // Cerrar sesión
      UserCache.cachedUser = null; // Limpiar la caché al cerrar sesión
      Navigator.pushReplacementNamed(context, '/loginPage'); // Navegar a la pantalla de login
    } catch (e) {
      // Mostrar un mensaje de error en caso de que algo falle al cerrar sesión
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al cerrar sesión: $e'),
      ));
    }
  }

  // Manejo de la acción de retroceso (Botón back)
  Future<bool> _onWillPop() async {
    final currentTime = DateTime.now();
    final isBackPressedTwice = _lastPressedTime == null ||
        currentTime.difference(_lastPressedTime!) > const Duration(seconds: 2);

    if (isBackPressedTwice) {
      _lastPressedTime = currentTime;
      // Muestra un mensaje para indicar al usuario que presione nuevamente
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Presione nuevamente para cerrar sesión y salir")),
      );
      return Future.value(false); // No salir aún
    } else {
      await _signOut(); // Cerrar sesión si presiona el back dos veces
      return Future.value(true); // Salir de la app
    }
  }

  void navigationBottomBar(int index) {
    setState(() {
      _selectecIndex = index;
    });
  }

  final List<Widget> _pages = [
    MySavesPage(),
    ServicesOffersPage(),
    MyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomCustomNavigationBar(
          onTabChange: (index) => navigationBottomBar(index),
        ),
        body: _pages[_selectecIndex],
      ),
    );
  }
}
