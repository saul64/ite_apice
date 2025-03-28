import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  final String nombre;
  final String apellido;
  final String email;
  final String carrera;

  UserModel({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.carrera,
  });

  // Método para convertir el Map de Firestore en un UserModel
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      nombre: data['nombre'] ?? '',
      apellido: data['apellido'] ?? '',
      email: data['email'] ?? '',
      carrera: data['carrera'] ?? '',
    );
  }
}

void saveUserData(UserModel user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('nombre', user.nombre);
  prefs.setString('apellido', user.apellido);
  prefs.setString('email', user.email);
  prefs.setString('carrera', user.carrera);
}

Future<UserModel?> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  String? nombre = prefs.getString('nombre');
  String? apellido = prefs.getString('apellido');
  String? email = prefs.getString('email');
  String? carrera = prefs.getString('carrera');
  
  if (nombre != null && apellido != null && email != null && carrera != null) {
    return UserModel(
      nombre: nombre,
      apellido: apellido,
      email: email,
      carrera: carrera,
    );
  }
  return null;
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  UserModel? user; // Variable para almacenar el usuario
  bool isLoading = true; // Estado de carga

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    UserModel? storedUser = await getUserData(); // Obtener datos de SharedPreferences
    if (storedUser != null) {
      setState(() {
        user = storedUser;
        isLoading = false;
      });
    } else {
      // Si no hay datos guardados, obtenerlos desde Firebase
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
        if (userData.exists) {
          setState(() {
            user = UserModel.fromMap(userData.data() as Map<String, dynamic>);
            isLoading = false;
          });
        }
      }
    }
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
                  Text('Nombre: ${user?.nombre ?? ''}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Apellido: ${user?.apellido ?? ''}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Email: ${user?.email ?? ''}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Carrera: ${user?.carrera ?? ''}', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
    );
  }
}
