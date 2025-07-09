import 'package:flutter/material.dart';
import '../../core/constants.dart';

class CanchaDetalleScreen extends StatelessWidget {
  final String nombreCancha;
  final String imagen;
  final String ubicacion;
  final double precio;
  final String tipo;

  const CanchaDetalleScreen({
    Key? key,
    this.nombreCancha = "Villa Morra - Club de Padel",
    this.imagen = "assets/villa_morra.png",
    this.ubicacion = "Av. Ejemplo 123, Ciudad",
    this.precio = 150.0,
    this.tipo = "Fútbol 5",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          nombreCancha,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagen, height: 180, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              nombreCancha,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on, color: kPrimarySwatch, size: 20),
                const SizedBox(width: 4),
                Text(ubicacion),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Chip(
                  label: Text(tipo),
                  backgroundColor: kPrimarySwatch.withOpacity(0.1),
                ),
                const SizedBox(width: 10),
                Chip(
                  label: Text("Gs. $precio/hora"),
                  backgroundColor: kPrimarySwatch.withOpacity(0.1),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Descripción",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            const SizedBox(height: 6),
            const Text(
                "Hermosa cancha de césped sintético en excelente ubicación, perfecta para partidos y torneos."),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimarySwatch,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // Navegar a reservar cancha
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: const Text("Reservar"),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: kPrimarySwatch),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // Navegar a comentarios pantalla
                  },
                  icon: Icon(Icons.comment, color: kPrimarySwatch),
                  label: Text("Comentarios", style: TextStyle(color: kPrimarySwatch)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Aquí puedes agregar una lista de horarios disponibles, servicios, etc.
          ],
        ),
      ),
    );
  }
}