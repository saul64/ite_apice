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

  // Método para convertir un Map de Firestore a UserModel
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      nombre: data['nombre'] ?? '',
      apellido: data['apellido'] ?? '',
      email: data['email'] ?? '',
      carrera: data['carrera'] ?? '',
    );
  }
}
