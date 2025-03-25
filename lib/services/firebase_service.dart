//conexion a la base de datos
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

//registrando usuario
Future<void> registerUser(String nombre, String apellido, String email, String password, String carrera) async {
  try {
    print("Guardando en Firestore...");
    print("Nombre: $nombre, Apellido: $apellido, Email: $email, Carrera: $carrera");

    await firestoreDB.collection('users').add({
      'nombre': nombre,
      'apellido': apellido,
      'email': email,
      'password': password,
      'carrera': carrera,
      'createdAt': FieldValue.serverTimestamp(),
    });
    print("Usuario registrado con éxito");
  } catch (e) {
    print("Error al registrar usuario: $e");
  }
}

//logeando usuario
Future<bool> loginUser(String email, String password) async {
  try {
    QuerySnapshot querySnapshot = await firestoreDB
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
      print("Usuario no encontrado");
      return false;
    }

    var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;

    if (userData['password'] == password) {
      print("Inicio de sesión exitoso");
      return true;
    } else {
      print("Contraseña incorrecta");
      return false;
    }
  } catch (e) {
    print("Error al iniciar sesión: $e");
    return false;
  }
}
