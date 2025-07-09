import 'package:flutter/material.dart';
import '../../core/constants.dart';

class PagosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pagos = const [
    {
      "cancha": "Villa Morra - Club de Padel",
      "fecha": "2025-07-01",
      "monto": 150.0,
      "metodo": "Tarjeta",
      "imagen": "assets/villa_morra.png"
    },
    {
      "cancha": "Mburicao Parque Deportivo",
      "fecha": "2025-06-22",
      "monto": 140.0,
      "metodo": "Yape",
      "imagen": "assets/mburicao.png"
    },
    {
      "cancha": "Padel Center",
      "fecha": "2025-06-10",
      "monto": 120.0,
      "metodo": "Plin",
      "imagen": "assets/padel_center.png"
    },
  ];

  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Pagos", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pagos.length,
        itemBuilder: (context, i) {
          final pago = pagos[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  pago["imagen"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(pago["cancha"], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Fecha: ${pago["fecha"]}\nMétodo: ${pago["metodo"]}"),
              trailing: Text(
                "Gs. ${pago["monto"]}",
                style: TextStyle(color: kPrimarySwatch, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}