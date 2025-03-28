import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  final String? selectedTipoActividad;
  final String? selectedModalidad;
  final List<String> selectedCarreras; // Carreras seleccionadas
  final Function(String?) onTipoActividadChanged;
  final Function(String?) onModalidadChanged;
  final Function(String) onCarreraToggled; // Función para manejar cambios en las carreras
  final VoidCallback onApplyFilters;
  final List<String> availableCarreras; // Lista de carreras disponibles
  final bool isInterna; // Filtro para actividades internas
  final bool isExterna; // Filtro para actividades externas
  final Function(bool) onInternaChanged; // Función para manejar el filtro interno
  final Function(bool) onExternaChanged; // Función para manejar el filtro externo

  const CustomEndDrawer({
    super.key,
    required this.selectedTipoActividad,
    required this.selectedModalidad,
    required this.selectedCarreras,
    required this.onTipoActividadChanged,
    required this.onModalidadChanged,
    required this.onCarreraToggled,
    required this.onApplyFilters,
    required this.availableCarreras,
    required this.isInterna,
    required this.isExterna,
    required this.onInternaChanged,
    required this.onExternaChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        children: [
          const Text(
            "Filtros",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Filtro por tipo de actividad
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Tipo de Actividad",
              border: OutlineInputBorder(),
            ),
            value: selectedTipoActividad,
            items: [
              "Todas las actividades", 
              "Servicio Social",
              "Residencias",
              "Practicas Profesionales",
            ].map((tipo) {
              return DropdownMenuItem(
                value: tipo,
                child: Text(tipo),
              );
            }).toList(),
            onChanged: onTipoActividadChanged,
          ),
          const SizedBox(height: 20),
          // Filtro por modalidad
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Modalidad",
              border: OutlineInputBorder(),
            ),
            value: selectedModalidad,
            items: [
              "Presencial",
              "Híbrido",
              "Remoto",
            ].map((modalidad) {
              return DropdownMenuItem(
                value: modalidad,
                child: Text(modalidad),
              );
            }).toList(),
            onChanged: onModalidadChanged,
          ),
          const SizedBox(height: 20),
          // Filtro por carrera
          const Text(
            "Carreras",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...availableCarreras.map((carrera) {
            return CheckboxListTile(
              title: Text(carrera),
              value: selectedCarreras.contains(carrera),
              onChanged: (isChecked) {
                onCarreraToggled(carrera);
              },
            );
          }).toList(),
          const SizedBox(height: 20),
          // Filtro por dependencia
          const Text(
            "Dependencia",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            title: const Text("Interna (Instituto Tecnologico de Ensenada)"),
            value: isInterna,
            onChanged: (value) {
              onInternaChanged(value!);
            },
          ),
          CheckboxListTile(
            title: const Text("Externa (Cualquier otra dependencia)"),
            value: isExterna,
            onChanged: (value) {
              onExternaChanged(value!);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onApplyFilters();
              Navigator.of(context).pop(); // Cerrar el Drawer
            },
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }
}