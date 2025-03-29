import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ite_apice/models/user_cache.dart'; // Asegúrate de importar tu caché de usuario
import 'package:ite_apice/services/firebase_service.dart'; // Asegúrate de importar tu servicio de Firebase
import 'package:ite_apice/models/user_model.dart'; // Asegúrate de tener un modelo de usuario adecuado

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
      Navigator.pushReplacementNamed(context, '/loginPage'); // Navegar a la pantalla de login
    } catch (e) {
      // Mostrar un mensaje de error en caso de que algo falle al cerrar sesión
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al cerrar sesión: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "${user?.nombre ?? 'Cargando...'} ${user?.apellido ?? ''}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff042048),
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.verified_user,
                      size: 60,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildProfileInfo("Nombre", user?.nombre ?? 'Cargando...'),
                  _buildProfileInfo("Apellido", user?.apellido ?? 'Cargando...'),
                  _buildProfileInfo("Email", user?.email ?? 'Cargando...'),
                  _buildProfileInfo("Carrera", user?.carrera ?? 'Cargando...'),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _signOut,
                    icon: Icon(Icons.logout),
                    label: Text('Cerrar sesión'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}