import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomCustomNavigationBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const BottomCustomNavigationBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco para el contenedor
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -3), // Sombra hacia arriba
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: GNav(
        selectedIndex: 1,
        onTabChange: onTabChange,
        gap: 8, // Espaciado entre el ícono y el texto
        color: Colors.black, // Color del ícono inactivo
        activeColor: Colors.white, // Color del ícono activo
        iconSize: 24, // Tamaño del ícono
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Espaciado interno de cada botón
        tabBackgroundColor: Color(0xff042048), // Fondo del botón activo
        tabBorderRadius: 15, // Bordes redondeados de las pestañas
        tabs: const [
          GButton(
            icon: Icons.add_to_photos,
            text: 'Guardadas',
          ),
          GButton(
            icon: Icons.menu_book_rounded,
            text: '',
          ),
          GButton(
            icon: Icons.person,
            text: 'Perfil',
          ),
        ],
      ),
    );
  }
}