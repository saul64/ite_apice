import 'package:flutter/material.dart';
import 'package:ite_apice/models/actividad.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // Importa Clipboard

class ActivityDetailsCard extends StatelessWidget {
  final Actividad actividad;
  final bool isInSaved;

  const ActivityDetailsCard({
    super.key,
    required this.actividad,
    this.isInSaved = false
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ActividadProvider>(
      builder: (context, actividadProvider, child) => Card(
        margin: const EdgeInsets.all(16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con tipo y modalidad
              Row(
                children: [
                  _buildInfoChip(actividad.tipoActividad, Colors.blue),
                  const SizedBox(width: 8),
                  _buildInfoChip(actividad.modalidad, Colors.green),
                ],
              ),
              const SizedBox(height: 16),

              // Título y dependencia
              Text(
                actividad.nombreActividad,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                actividad.dependencia,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),

              // Descripción
              Text(
                actividad.descripcionActividad,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),

              // Carreras aplicables
              const Text(
                'Carreras aplicables:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: actividad.carreras
                    .map((carrera) => _buildCareerChip(carrera))
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Responsable
              const Divider(),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Responsable:\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${actividad.responsable}\n'),
                    const TextSpan(
                      text: 'Contacto: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // Contacto copiable
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: actividad.contacto));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Contacto copiado al portapapeles!')),
                  );
                },
                child: Text(
                  actividad.contacto,
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Botones de acción
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Botón "Me interesa"
                    if (!isInSaved)
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF042048),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Verificar si la actividad ya está en savedActividades
                            if (actividadProvider.savedActividades.contains(actividad)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('La actividad ya está en actividades guardadas.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              // Agregar a savedActividades
                              actividadProvider.addToSaved(actividad);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('¡Agregado a actividades guardadas!'),
                                ),
                              );
                              Navigator.pop(context); // Cerrar la tarjeta
                            }
                          },
                          child: const Text(
                            'Me interesa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    else
                      // Botón "Eliminar"
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Eliminar de savedActividades
                            actividadProvider.removeFromSaved(actividad);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('¡Eliminado de actividades guardadas!'),
                              ),
                            );
                            Navigator.pop(context); // Cerrar la tarjeta
                          },
                          child: const Text(
                            'Eliminar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 16), // Espaciado entre los botones
                    // Botón "Registrarse"
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF042048),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Acción al presionar "Registrarse"
                          Navigator.pop(context); // Cerrar la tarjeta
                        },
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para chips de información
  Widget _buildInfoChip(String text, Color color) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  // Widget para chips de carreras
  Widget _buildCareerChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: const Color(0xFF042048).withOpacity(0.1),
      labelStyle: const TextStyle(color: Color(0xFF042048)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}