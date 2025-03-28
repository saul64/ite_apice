import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ite_apice/models/actividad.dart'; // Asegúrate de importar tu modelo de Actividad

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Función para registrar al usuario con correo y contraseña
  Future<User?> registerUser(
    String email,
    String password,
    String nombre,
    String apellido,
    String carrera,
  ) async {
    try {
      // Crear el usuario con correo y contraseña
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        // Guardar nombre, apellido, carrera y otros datos en Firestore
        await _firestore.collection("usuarios").doc(user.uid).set({
          "nombre": nombre,
          "apellido": apellido,
          "email": email,
          "uid": user.uid,
          "carrera": carrera,
        });
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("El correo electrónico ya está registrado.");
        // Retornar null o un mensaje específico si el correo ya está en uso
        return null;
      } else {
        print("Error al registrar usuario: ${e.message}");
        return null;
      }
    } catch (e) {
      print("Error desconocido: $e");
      return null;
    }
  }

  // Función para iniciar sesión con correo y contraseña
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error al iniciar sesión: $e");
      return null;
    }
  }
  //Aqui ira la funcion para recuperar los datos del usuario para mostrarlos en la pantalla de perfil
  //y para aplicar el filtro rapido "Para ti" de acuerdo al perfil del usuario (su carrera seleccionada)
}

class ActividadProvider extends ChangeNotifier {
  List<Actividad> _actividades = [];
  List<Actividad> _savedActividades = []; // Lista de actividades guardadas

  List<Actividad> get actividades => _actividades;
  List<Actividad> get savedActividades => _savedActividades;

  // Función para obtener las actividades desde Firebase y manejar el estado
  Future<void> loadActividades() async {
    try {
      // Obtiene el evento de la base de datos
      DatabaseEvent snapshot = await FirebaseDatabase.instance.ref().child('actividades').once();

      // Verifica si los datos existen
      if (snapshot.snapshot.exists) {
        // Si existe, mapea el mapa de actividades
        Map<dynamic, dynamic> actividadesMap = snapshot.snapshot.value as Map<dynamic, dynamic>;

        // Convierte cada actividad (mapa) en un objeto Actividad
        _actividades = actividadesMap.entries.map((entry) {
          // 'entry.value' contiene los datos de cada actividad
          return Actividad.fromMap(Map<String, dynamic>.from(entry.value));
        }).toList();

        // Notifica a los listeners para actualizar la UI
        notifyListeners();
      }
    } catch (e) {
      print("Error al obtener actividades: $e");
    }
  }

  // Función para agregar una actividad a la lista de guardados
  void addToSaved(Actividad actividad) {
    if (!_savedActividades.contains(actividad)) {
      _savedActividades.add(actividad);
      notifyListeners(); // Notifica a los listeners para actualizar la UI
    }
  }

  // Función para eliminar una actividad de la lista de guardados
  void removeFromSaved(Actividad actividad) {
    if (_savedActividades.contains(actividad)) {
      _savedActividades.remove(actividad);
      notifyListeners(); // Notifica a los listeners para actualizar la UI
    }
  }
}