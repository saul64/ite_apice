class Actividad {
  String tipoActividad;
  String modalidad;
  String nombreActividad;
  String dependencia;
  String descripcionActividad;
  List<String> carreras;
  String responsable;
  String contacto;

  Actividad({
    required this.tipoActividad,
    required this.modalidad,
    required this.nombreActividad,
    required this.dependencia,
    required this.descripcionActividad,
    required this.carreras,
    required this.responsable,
    required this.contacto,
  });

  // Constructor fromMap para convertir los datos del mapa en una Actividad
  factory Actividad.fromMap(Map<String, dynamic> map) {
    return Actividad(
      tipoActividad: map['tipoActividad'] ?? '',
      modalidad: map['modalidad'] ?? '',
      nombreActividad: map['nombreActividad'] ?? '',
      dependencia: map['dependencia'] ?? '',
      descripcionActividad: map['descripcionActividad'] ?? '',
      carreras: List<String>.from(map['carreras'] ?? []),
      responsable: map['responsable'] ?? '',
      contacto: map['contacto'] ?? '',
    );
  }

  // Método para convertir el mapa de todas las actividades a una lista de objetos Actividad
  static List<Actividad> fromJson(Map<String, dynamic> json) {
    List<Actividad> actividadesList = [];
    json['actividades'].forEach((key, value) {
      actividadesList.add(Actividad.fromMap(value));
    });
    return actividadesList;
  }
}