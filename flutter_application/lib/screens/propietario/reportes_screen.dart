import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ReportesScreen extends StatelessWidget {
  const ReportesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ejemplo de datos
    final ingresosHoy = 1200000;
    final reservasHoy = 8;
    final reservasMes = 42;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        title: const Text('Reportes', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen de actividad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 16),
            Card(
              color: kPrimarySwatch.withOpacity(0.06),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                leading: Icon(Icons.attach_money, color: kPrimarySwatch, size: 36),
                title: Text('Ingresos de hoy', style: TextStyle(fontSize: 16)),
                trailing: Text("Gs. $ingresosHoy", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Card(
              color: kPrimarySwatch.withOpacity(0.06),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                leading: Icon(Icons.event, color: kPrimarySwatch, size: 36),
                title: Text('Reservas de hoy', style: TextStyle(fontSize: 16)),
                trailing: Text("$reservasHoy", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Card(
              color: kPrimarySwatch.withOpacity(0.06),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                leading: Icon(Icons.calendar_month, color: kPrimarySwatch, size: 36),
                title: Text('Reservas este mes', style: TextStyle(fontSize: 16)),
                trailing: Text("$reservasMes", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 30),
            Text('Ver más detalles en el futuro...', style: TextStyle(color: Colors.grey[600])),
            // Aquí puedes añadir gráficos, filtros por fechas, exportar, etc.
          ],
        ),
      ),
    );
  }
}