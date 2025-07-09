import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ReservasPropietarioScreen extends StatelessWidget {
  final List<Map<String, String>> reservas = const [
    {
      "cancha": "Villa Morra - Cancha 1",
      "cliente": "Juan P.",
      "fecha": "2025-07-05",
      "hora": "18:00",
      "estado": "Pendiente",
    },
    {
      "cancha": "Mburicao - Cancha 2",
      "cliente": "Maria R.",
      "fecha": "2025-07-05",
      "hora": "20:00",
      "estado": "Confirmada",
    },
  ];

  const ReservasPropietarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        title: const Text('Reservas', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservas.length,
        itemBuilder: (context, i) {
          final reserva = reservas[i];
          Color estadoColor = reserva["estado"] == "Confirmada"
              ? Colors.green
              : Colors.orange;
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.event, color: kPrimarySwatch),
              title: Text(reserva["cancha"]!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Cliente: ${reserva["cliente"]}\nFecha: ${reserva["fecha"]} - Hora: ${reserva["hora"]}"),
              trailing: Text(
                reserva["estado"]!,
                style: TextStyle(color: estadoColor, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Detalle/responder reserva
              },
            ),
          );
        },
      ),
    );
  }
}