//select para las carreras del usuario
// components/carrera_dropdown.dart
import 'package:flutter/material.dart';

class CarreraDropdown extends StatelessWidget {
  final String? selectedCarrera;
  final Function(String?) onChanged;

  const CarreraDropdown({
    super.key,
    required this.selectedCarrera,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff042048),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: Color(0xff042048),
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
