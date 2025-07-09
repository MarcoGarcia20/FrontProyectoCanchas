import 'package:flutter/material.dart';
import '../../core/constants.dart';

class DashboardPropietarioScreen extends StatelessWidget {
  const DashboardPropietarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos simulados para ejemplo
    final resumen = [
      {'icon': Icons.sports_soccer, 'label': 'Canchas', 'value': '3'},
      {'icon': Icons.event, 'label': 'Reservas hoy', 'value': '8'},
      {'icon': Icons.attach_money, 'label': 'Ingresos hoy', 'value': 'Gs. 1.200.000'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        title: const Text('Panel Propietario', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: resumen.map((item) => Column(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimarySwatch.withOpacity(0.15),
                    child: Icon(item['icon'] as IconData, color: kPrimarySwatch),
                  ),
                  const SizedBox(height: 8),
                  Text(item['value']!.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(item['label']!.toString(), style: TextStyle(color: Colors.black54, fontSize: 13)),
                ],
              )).toList(),
            ),
            const SizedBox(height: 32),
            Text('Acciones rápidas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.sports, color: kPrimarySwatch),
              title: const Text('Gestionar canchas'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // Navegar a gestión de canchas
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: kPrimarySwatch),
              title: const Text('Ver reservas'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // Navegar a reservas
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: kPrimarySwatch),
              title: const Text('Reportes'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // Navegar a reportes
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: kPrimarySwatch),
              title: const Text('Mi perfil'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // Navegar a perfil
              },
            ),
          ],
        ),
      ),
    );
  }
}