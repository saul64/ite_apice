// Validar si las contraseñas coinciden
bool doPasswordsMatch(String password, String confirmPassword) {
  return password == confirmPassword;
}

// Validar el formato del correo electrónico
bool isValidEmail(String email) {
  final emailPattern = r'^[a-zA-Z0-9._%+-]+@ite\.edu\.mx$';
  final regex = RegExp(emailPattern);
  return regex.hasMatch(email);
}

// Validar que la contraseña tenga una mayúscula y un carácter especial
bool isSecurePassword(String password) {
  final passwordPattern = r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$';
  final regex = RegExp(passwordPattern);
  return regex.hasMatch(password);
}