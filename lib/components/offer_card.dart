import 'package:flutter/material.dart';
import 'package:ite_apice/components/activity_detail_card.dart';
import 'package:ite_apice/models/actividad.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:provider/provider.dart';

class OfferCard extends StatelessWidget {
  final Actividad actividad;
  final bool isInSaved;
  const OfferCard({
    super.key,
    required this.actividad,
    this.isInSaved = false
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<ActividadProvider>(builder: (context, value, child) => Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Color(0xff042048),
          width: 6
        )
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16,48,16,16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado con título y posible logo
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff042048),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.work_outline, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      actividad.dependencia,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff042048)
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Descripción
                Text(
                  actividad.descripcionActividad,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Botón "Ver" alineado a la derecha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos
                  children: [
                    // Botón de carreras a la izquierda
                    TextButton.icon(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Carreras aplicables"),
                          content: SizedBox(
                            height: 200, // Altura fija para el contenido del diálogo
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: actividad.carreras.map((c) => Text("- $c")).toList(),
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Cerrar"),
                            ),
                          ],
                        ),
                      ),
                      icon: Icon(Icons.info_outline, color: Color(0xff042048)),
                      label: const Text(
                        "Carreras",
                        style: TextStyle(color: Color(0xff042048)),
                      ),
                    ),

                    // Ícono "Ver" a la derecha
                    IconButton(
                      icon: Icon(Icons.visibility, color: Color(0xff042048)),
                      onPressed: () => _showDetailsPopup(context, actividad),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Chip en la esquina superior derecha
          Positioned(
            top: 2,
            right:8,
            child: Chip(
              label: Text(
                actividad.tipoActividad,
                style: const TextStyle(fontSize: 12,color: Colors.white),
              ),
              backgroundColor: Color(0xff042048),
            ),
          ),
        ],
      ),
    ),
    
    );
  }
  void _showDetailsPopup(BuildContext context, actividad) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: ActivityDetailsCard(actividad: actividad, isInSaved: isInSaved,),
        ),
      ),
    );
  }
}