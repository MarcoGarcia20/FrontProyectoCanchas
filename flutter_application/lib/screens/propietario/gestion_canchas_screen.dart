import 'package:flutter/material.dart';
import '../../core/constants.dart';

class GestionCanchasScreen extends StatelessWidget {
  final List<Map<String, String>> canchas = const [
    {
      "nombre": "Villa Morra - Cancha 1",
      "tipo": "Fútbol 5",
      "estado": "Disponible",
      "imagen": "assets/villa_morra.png",
    },
    {
      "nombre": "Mburicao - Cancha 2",
      "tipo": "Padel",
      "estado": "En mantenimiento",
      "imagen": "assets/mburicao.png",
    },
  ];

  const GestionCanchasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        title: const Text('Gestionar Canchas', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimarySwatch,
        child: const Icon(Icons.add),
        onPressed: () {
          // Acción para agregar cancha
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: canchas.length,
        itemBuilder: (context, i) {
          final cancha = canchas[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cancha["imagen"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(cancha["nombre"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${cancha["tipo"]} - ${cancha["estado"]}"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  // Editar o eliminar
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'editar', child: Text('Editar')),
                  const PopupMenuItem(value: 'eliminar', child: Text('Eliminar')),
                ],
              ),
              onTap: () {
                // Detalle o edición
              },
            ),
          );
        },
      ),
    );
  }
}