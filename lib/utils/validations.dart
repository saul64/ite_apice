// Validar si las contraseñas coinciden
bool doPasswordsMatch(String password, String confirmPassword) {
  return password == confirmPassword;
}

// Validar el formato del correo electrónico
bool isValidEmail(String email) {
  
  // Validar si el correo tiene el formato adecuado (para el caso específico de ITESM)
  final emailPattern = r'^al\d{8}@ite\.edu\.mx$';
  final regex = RegExp(emailPattern);

  return regex.hasMatch(email);
}

// Validar que la contraseña tenga una mayúscula y un carácter especial
bool isSecurePassword(String password) {
  final passwordPattern = r'^(?=.*[A-Z])(?=.*[\W_]).{8,12}$';
  final regex = RegExp(passwordPattern);
  return regex.hasMatch(password);
}

// Validar que el nombre o apellido no tenga caracteres no deseados
bool isValidName(String name) {
  String trimmedName = name.trim();

  // Verificar que el nombre no esté vacío
  if (trimmedName.isEmpty) {
    return false;
  }

  // Verificar que no haya múltiples espacios consecutivos
  if (RegExp(r'\s{2,}').hasMatch(trimmedName)) {
    return false;
  }

  // Verificar que solo contenga letras (incluyendo acentos y eñes) y espacios
  if (RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(trimmedName)) {
    return true;
  }

  return false;
}

bool isValidFirstName(String firstName) {
  return isValidName(firstName);
}

bool isValidLastName(String lastName) {
  return isValidName(lastName);
}
