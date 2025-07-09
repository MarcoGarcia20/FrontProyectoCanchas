import 'package:flutter/material.dart';
import '../../core/constants.dart';

class HistorialReservasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reservas = const [
    {
      "cancha": "Villa Morra - Club de Padel",
      "fecha": "2025-07-01",
      "hora": "18:00",
      "estado": "Completada",
      "imagen": "assets/villa_morra.png"
    },
    {
      "cancha": "Mburicao Parque Deportivo",
      "fecha": "2025-06-22",
      "hora": "20:00",
      "estado": "Cancelada",
      "imagen": "assets/mburicao.png"
    },
    {
      "cancha": "Padel Center",
      "fecha": "2025-06-10",
      "hora": "19:00",
      "estado": "Completada",
      "imagen": "assets/padel_center.png"
    },
  ];

  const HistorialReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Historial de Reservas", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservas.length,
        itemBuilder: (context, i) {
          final reserva = reservas[i];
          Color estadoColor = reserva["estado"] == "Completada"
              ? Colors.green
              : Colors.redAccent;
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  reserva["imagen"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(reserva["cancha"], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Fecha: ${reserva["fecha"]} - Hora: ${reserva["hora"]}"),
              trailing: Text(
                reserva["estado"],
                style: TextStyle(color: estadoColor, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}