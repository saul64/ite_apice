import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ite_apice/components/custom_end_drawer.dart';
import 'package:ite_apice/components/offer_card.dart';
import 'package:ite_apice/models/actividad.dart';
import 'package:ite_apice/models/user_cache.dart';
import 'package:ite_apice/models/user_model.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:provider/provider.dart';

class ServicesOffersPage extends StatefulWidget {
  const ServicesOffersPage({super.key});

  @override
  State<ServicesOffersPage> createState() => _ServicesOffersPage();
}

class _ServicesOffersPage extends State<ServicesOffersPage> {
  UserModel? user; // Variable para almacenar los datos del usuario
  bool isLoading = true; // Estado de carga
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  // Función para cargar los datos del usuario
  Future<void> loadUserData() async {
    if (UserCache.cachedUser != null) {
      // Si ya tenemos los datos en memoria, los usamos directamente
      setState(() {
        user = UserCache.cachedUser;
        isLoading = false;
      });
    } else {
      // Si no tenemos los datos en memoria, los obtenemos desde Firebase
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Obtener los datos del usuario desde Firestore
        Map<String, dynamic>? userData = await _firebaseService.getUserData(
          currentUser.uid,
        );
        if (userData != null) {
          setState(() {
            user = UserModel.fromMap(userData);
            UserCache.cachedUser = user; // Almacenamos los datos en caché
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          showError("No se encontraron datos del usuario.");
        }
      } else {
        setState(() {
          isLoading = false;
        });
        showError("Usuario no autenticado.");
      }
    }
  }

  // Mostrar errores
  void showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Filtros seleccionados
  String? selectedTipoActividad;
  String? selectedModalidad;
  List<String> selectedCarreras = [];
  bool isInterna = false; // Filtro para actividades internas
  bool isExterna = false; // Filtro para actividades externas

  // Lista estática de carreras disponibles
  final List<String> availableCarreras = [
    "Sistemas Computacionales",
    "Industrial",
    "Electromecanica",
    "Mecatronica",
    "Innovacion Agricola",
    "Gestion Empresarial",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ActividadProvider>(
      builder: (context, actividadProvider, child) {
        // Cargar las actividades si aún no se han cargado
        if (actividadProvider.actividades.isEmpty &&
            !actividadProvider.isLoading) {
          actividadProvider.loadActividades();
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "${user?.nombre ?? 'Cargando...'} ${user?.apellido ?? ''} ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0xff042048),
            foregroundColor: Colors.white,

            actions: [
              Builder(
                builder: (BuildContext innerContext) {
                  return IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      // Usar el contexto del Builder para abrir el Drawer
                      Scaffold.of(innerContext).openEndDrawer();
                    },
                  );
                },
              ),
            ],
          ),
          endDrawer: CustomEndDrawer(
            selectedTipoActividad: selectedTipoActividad,
            selectedModalidad: selectedModalidad,
            selectedCarreras: selectedCarreras,
            availableCarreras: availableCarreras,
            isInterna: isInterna,
            isExterna: isExterna,
            onTipoActividadChanged: (value) {
              setState(() {
                selectedTipoActividad = value;
              });
            },
            onModalidadChanged: (value) {
              setState(() {
                selectedModalidad = value;
              });
            },
            onCarreraToggled: (carrera) {
              setState(() {
                if (selectedCarreras.contains(carrera)) {
                  selectedCarreras.remove(carrera);
                } else {
                  selectedCarreras.add(carrera);
                }
              });
            },
            onInternaChanged: (value) {
              setState(() {
                isInterna = value;
                if (isInterna) {
                  isExterna =
                      false; // Desactivar externa si interna está activa
                }
              });
            },
            onExternaChanged: (value) {
              setState(() {
                isExterna = value;
                if (isExterna) {
                  isInterna =
                      false; // Desactivar interna si externa está activa
                }
              });
            },
            onApplyFilters: () {
              // Aquí puedes aplicar los filtros seleccionados
              print(
                "Filtros aplicados: $selectedTipoActividad, $selectedModalidad, $selectedCarreras, Interna: $isInterna, Externa: $isExterna",
              );
              setState(() {}); // Refresca la pantalla para aplicar los filtros
            },
          ),
          body:
              actividadProvider.isLoading
                  ? const Center(
                    child: CircularProgressIndicator(),
                  ) // Loading centrado
                  : SingleChildScrollView(
                    child: Column(
                      children: [
                        actividadProvider.actividades.isEmpty
                            ? const Center(
                              child: Text("No hay actividades disponibles"),
                            )
                            : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: actividadProvider.actividades.length,
                              itemBuilder: (context, index) {
                                Actividad actividad =
                                    actividadProvider.actividades[index];

                                // Filtrar actividades según los filtros seleccionados
                                if ((selectedTipoActividad != null &&
                                        selectedTipoActividad !=
                                            "Todas las actividades" &&
                                        actividad.tipoActividad !=
                                            selectedTipoActividad) ||
                                    (selectedModalidad != null &&
                                        actividad.modalidad !=
                                            selectedModalidad) ||
                                    (selectedCarreras.isNotEmpty &&
                                        !actividad.carreras.any(
                                          (carrera) => selectedCarreras
                                              .contains(carrera),
                                        )) ||
                                    (isInterna &&
                                        actividad.dependencia !=
                                            "Instituto Tecnologico de Ensenada") ||
                                    (isExterna &&
                                        actividad.dependencia ==
                                            "Instituto Tecnologico de Ensenada")) {
                                  return const SizedBox.shrink(); // No mostrar actividades que no coincidan
                                }

                                return OfferCard(
                                  actividad: actividad,
                                ); // Mostrar la actividad
                              },
                            ),
                      ],
                    ),
                  ),
        );
      },
    );
  }
}
