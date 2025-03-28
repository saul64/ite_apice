import 'package:flutter/material.dart';
import 'package:ite_apice/components/offer_card.dart';
import 'package:ite_apice/models/actividad.dart';
import 'package:ite_apice/models/user_model.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ite_apice/models/user_cache.dart'; // Asegúrate de tener el modelo y la caché de usuario

class MySavesPage extends StatefulWidget {
  const MySavesPage({super.key});

  @override
  _MySavesPageState createState() => _MySavesPageState();
}

class _MySavesPageState extends State<MySavesPage> {
  UserModel? user; // Variable para almacenar los datos del usuario
  bool isLoading = true; // Estado de carga
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  // Función para cargar los datos del usuario
  Future<void> loadUserData() async {
    if (UserCache.cachedUser != null) {
      // Si ya tenemos los datos en memoria, los usamos directamente
      setState(() {
        user = UserCache.cachedUser;
        isLoading = false;
      });
    } else {
      // Si no tenemos los datos en memoria, los obtenemos desde Firebase
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Obtener los datos del usuario desde Firestore
        Map<String, dynamic>? userData = await _firebaseService.getUserData(
          currentUser.uid,
        );
        if (userData != null) {
          setState(() {
            user = UserModel.fromMap(userData);
            UserCache.cachedUser = user; // Almacenamos los datos en caché
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          showError("No se encontraron datos del usuario.");
        }
      } else {
        setState(() {
          isLoading = false;
        });
        showError("Usuario no autenticado.");
      }
    }
  }

  // Mostrar errores
  void showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Función para cerrar sesión
  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut(); // Cerrar sesión
      UserCache.cachedUser = null; // Limpiar la caché al cerrar sesión
      Navigator.pushReplacementNamed(
        context,
        '/loginPage',
      ); // Navegar a la pantalla de login
    } catch (e) {
      // Mostrar un mensaje de error en caso de que algo falle al cerrar sesión
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al cerrar sesión: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ActividadProvider>(
      builder:
          (context, act, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xff042048),
              title: Text(
                "${user?.nombre ?? 'Cargando...'} ${user?.apellido ?? ''}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              foregroundColor: Colors.white,
            ),
            body: SafeArea(
              child:
                  act.savedActividades.isEmpty
                      ? const Center(
                        child: Text(
                          'Aún no tienes actividades guardadas.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                      : ListView.builder(
                        itemCount: act.savedActividades.length,
                        itemBuilder: (context, index) {
                          Actividad actividad = act.savedActividades[index];
                          return OfferCard(
                            actividad: actividad,
                            isInSaved: true,
                          );
                        },
                      ),
            ),
          ),
    );
  }
}
