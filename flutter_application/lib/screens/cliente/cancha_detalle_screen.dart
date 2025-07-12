import 'package:flutter/material.dart';
import '../../core/constants.dart';

class CanchaDetalleScreen extends StatelessWidget {
  const CanchaDetalleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Recibe los argumentos o usa valores por defecto
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final nombreCancha = args?['titulo'] ?? "Villa Morra - Club de Padel";
    final imagen      = args?['imagen'] ?? "assets/villa_morra.png";
    final ubicacion   = args?['ubicacion'] ?? args?['distrito'] ?? "Av. Ejemplo 123, Ciudad";
    final precio      = args?['precio'] ?? "150.0";
    final tipo        = args?['tipo'] ?? "Fútbol 5";

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
              child: Image.asset(
                imagen,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.image_not_supported, color: Colors.red, size: 48),
                  ),
                ),
              ),
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
                    // Navegar a reserva_screen pasando datos de la cancha
                    Navigator.pushNamed(
                      context,
                      '/reserva',
                      arguments: {
                        'titulo': nombreCancha,
                        'imagen': imagen,
                        'ubicacion': ubicacion,
                        'precio': precio,
                        'tipo': tipo,
                      },
                    );
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
                    Navigator.pushNamed(context, '/comentarios', arguments: {
                      'titulo': nombreCancha,
                      'imagen': imagen,
                      'ubicacion': ubicacion,
                    });
                  },
                  icon: Icon(Icons.comment, color: kPrimarySwatch),
                  label: Text("Comentarios", style: TextStyle(color: kPrimarySwatch)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Aquí puedes agregar una lista de horarios disponibles, servicios adicionales, etc.
          ],
        ),
      ),
    );
  }
}