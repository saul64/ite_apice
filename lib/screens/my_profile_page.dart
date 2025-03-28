import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Obtener los datos del usuario desde Firestore
      Map<String, dynamic>? userData = await _firebaseService.getUserData(currentUser.uid);
      if (userData != null) {
        setState(() {
          user = UserModel.fromMap(userData); // Asegúrate de tener un constructor adecuado para UserModel
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

  // Mostrar errores
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Perfil')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${user?.nombre ?? 'Cargando...'}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Apellido: ${user?.apellido ?? 'Cargando...'}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Email: ${user?.email ?? 'Cargando...'}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Carrera: ${user?.carrera ?? 'Cargando...'}', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
    );
  }
}