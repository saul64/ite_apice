import 'package:flutter/material.dart';

class Actividad {
  String tipoActividad;
  String modalidad;
  String nombreActividad;
  String dependencia;
  String descripcionActividad;
  String carreras;
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
}

List<Actividad> actividades = [
  Actividad(
    tipoActividad: "Servicio Social",
    modalidad: "Presencial",
    nombreActividad: "Limpieza de Áreas Verdes",
    dependencia: "Instituto Tecnológico de Ensenada",
    descripcionActividad:
        "Apoyo en la limpieza de áreas verdes y jardines dentro de la institución para mejorar la imagen del campus.",
    carreras: "Ing. Sistemas Computacionales, Ing. Industrial",
    responsable: "Carlos Mendoza",
    contacto: "cmendoza@tecensenada.edu.mx",
  ),
  Actividad(
    tipoActividad: "Residencias Profesionales",
    modalidad: "Híbrido",
    nombreActividad: "Desarrollo de Software para Gestión Académica",
    dependencia: "SoftTech Solutions",
    descripcionActividad:
        "Creación de un sistema web para la gestión de actividades académicas y control de alumnos en una universidad.",
    carreras: "Ing. Sistemas Computacionales",
    responsable: "Ana Rodríguez",
    contacto: "ana.rodriguez@softtech.com",
  ),
  Actividad(
    tipoActividad: "Prácticas",
    modalidad: "Remoto",
    nombreActividad: "Análisis y Optimización de Procesos Industriales",
    dependencia: "Industria Innovatec",
    descripcionActividad:
        "Análisis de procesos de manufactura y propuesta de mejoras para optimizar la producción y reducir costos operativos.",
    carreras: "Ing. Industrial, Ing. Electromecánica",
    responsable: "Javier Pérez",
    contacto: "jperez@innovatec.com",
  ),
  Actividad(
    tipoActividad: "Servicio Social",
    modalidad: "Presencial",
    nombreActividad: "Apoyo en el Sistema de Gestión Ambiental",
    dependencia: "Instituto Tecnológico de Ensenada",
    descripcionActividad:
        "Apoyo en la implementación y seguimiento del sistema de gestión ambiental en la institución.",
    carreras: "Ing. Mecatrónica, Ing. Innovación Agrícola",
    responsable: "María López",
    contacto: "mlopez@tecensenada.edu.mx",
  ),
  Actividad(
    tipoActividad: "Residencias Profesionales",
    modalidad: "Híbrido",
    nombreActividad: "Automatización de Procesos Industriales",
    dependencia: "ElectroAutomatix S.A.",
    descripcionActividad:
        "Desarrollo de soluciones de automatización para líneas de producción en fábricas.",
    carreras: "Ing. Mecatrónica, Ing. Electromecánica",
    responsable: "Fernando Silva",
    contacto: "fsilva@electroautomatix.com",
  ),
  Actividad(
    tipoActividad: "Prácticas",
    modalidad: "Remoto",
    nombreActividad: "Marketing y Estrategias Digitales",
    dependencia: "Consultora Digital ProMarketing",
    descripcionActividad:
        "Creación de estrategias digitales y análisis de métricas para mejorar la presencia online de clientes.",
    carreras: "Lic. Gestión Empresarial",
    responsable: "Sofía Ramírez",
    contacto: "sramirez@promarketing.com",
  ),
  Actividad(
    tipoActividad: "Servicio Social",
    modalidad: "Presencial",
    nombreActividad: "Limpieza y mantenimiento de canchas deportivas",
    dependencia: "Instituto Tecnológico de Ensenada",
    descripcionActividad:
        "Mantenimiento y limpieza de áreas deportivas para mejorar la experiencia de los estudiantes.",
    carreras: "Ing. Industrial, Ing. Mecatrónica",
    responsable: "Luis Fernández",
    contacto: "lfernandez@tecensenada.edu.mx",
  ),
  Actividad(
    tipoActividad: "Residencias Profesionales",
    modalidad: "Híbrido",
    nombreActividad: "Desarrollo de un ERP para PyMES",
    dependencia: "Innovate Solutions",
    descripcionActividad:
        "Desarrollo de un sistema ERP para la gestión de recursos y contabilidad de pequeñas empresas.",
    carreras: "Ing. Sistemas Computacionales, Lic. Gestión Empresarial",
    responsable: "Eduardo Gómez",
    contacto: "egomez@innovatesolutions.com",
  ),
  Actividad(
    tipoActividad: "Prácticas",
    modalidad: "Presencial",
    nombreActividad: "Fabricación de Componentes Mecánicos",
    dependencia: "Metalúrgica Alfa S.A.",
    descripcionActividad:
        "Diseño y fabricación de piezas mecánicas para la industria automotriz.",
    carreras: "Ing. Electromecánica, Ing. Mecatrónica",
    responsable: "Roberto Castellanos",
    contacto: "rcastellanos@metalurgicaalfa.com",
  ),
  Actividad(
    tipoActividad: "Servicio Social",
    modalidad: "Híbrido",
    nombreActividad: "Creación de Gafetes para el Personal Administrativo",
    dependencia: "Instituto Tecnológico de Ensenada",
    descripcionActividad:
        "Diseño y elaboración de gafetes de identificación para el personal administrativo de la institución.",
    carreras: "Ing. Sistemas Computacionales, Lic. Gestión Empresarial",
    responsable: "Diana Castillo",
    contacto: "dcastillo@tecensenada.edu.mx",
  ),
];

class PostLogeo extends StatelessWidget {
  const PostLogeo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cerrar sesión"),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: actividades.length,
              itemBuilder: (context, index) {
                final actividad = actividades[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("Carreras: ${actividad.carreras}"),
                    subtitle: Text(
                      "Tipo de Actividad: ${actividad.tipoActividad}\nDescripción: ${actividad.descripcionActividad}",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
