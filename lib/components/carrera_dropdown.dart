//select para las carreras del usuario
// components/carrera_dropdown.dart
import 'package:flutter/material.dart';

class CarreraDropdown extends StatelessWidget {
  final String? selectedCarrera;
  final Function(String?) onChanged;

  const CarreraDropdown({
    Key? key,
    required this.selectedCarrera,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 31, 75, 165),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: Color.fromARGB(255, 31, 75, 165),
      style: TextStyle(color: Colors.white),
      hint: Text(
        "Selecciona tu carrera",
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      items: [
        "Ing. Sistemas Computacionales",
        "Ing. Industrial",
        "Ing. Electromecánica",
        "Ing. Mecatrónica",
        "Ing. Innovación Agrícola",
        "Lic. Gestión Empresarial",
      ].map((String carrera) {
        return DropdownMenuItem<String>(
          value: carrera,
          child: Text(
            carrera,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
