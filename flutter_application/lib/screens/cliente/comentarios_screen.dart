import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ComentariosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> comentarios = const [
    {
      "usuario": "Juan P.",
      "comentario": "¡Excelente cancha y atención!",
      "calificacion": 5,
      "fecha": "2025-06-10"
    },
    {
      "usuario": "Maria R.",
      "comentario": "Todo limpio y seguro.",
      "calificacion": 4,
      "fecha": "2025-06-01"
    },
    {
      "usuario": "Carlos S.",
      "comentario": "Fácil de reservar. Volveré.",
      "calificacion": 5,
      "fecha": "2025-05-28"
    },
  ];

  const ComentariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Comentarios", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: comentarios.length,
        itemBuilder: (context, i) {
          final comentario = comentarios[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: kPrimarySwatch.withOpacity(0.2),
                child: Text(comentario["usuario"][0]),
              ),
              title: Text(comentario["usuario"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      comentario["calificacion"],
                      (index) => Icon(Icons.star, size: 16, color: Colors.amber),
                    ),
                  ),
                  Text(comentario["comentario"]),
                  Text(
                    comentario["fecha"],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}