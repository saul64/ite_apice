import 'package:flutter/material.dart';
import 'package:ite_apice/components/offer_card.dart';
import 'package:ite_apice/models/actividad.dart';
import 'package:ite_apice/services/firebase_service.dart';
import 'package:provider/provider.dart';

class MySavesPage extends StatelessWidget {
  const MySavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ActividadProvider>(builder: (context, act, child) => Scaffold(
      appBar: AppBar(
        title: Text('Mis guardados'),
      ),
      body: SafeArea(child: ListView.builder(
        itemCount: act.savedActividades.length,
        itemBuilder: (context, index) {
          Actividad actividad = act.savedActividades[index];
          return OfferCard(actividad: actividad, isInSaved: true,)
;        },

      )),
    ),
    );
  }
}