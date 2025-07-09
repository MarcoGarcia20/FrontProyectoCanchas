import 'package:flutter/material.dart';
import '../../core/constants.dart';

class PerfilPropietarioScreen extends StatelessWidget {
  const PerfilPropietarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos simulados de perfil
    final String nombre = "Carlos Ruiz";
    final String email = "carlos@email.com";
    final String telefono = "+595 981 123456";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        title: const Text('Mi Perfil', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: kPrimarySwatch.withOpacity(0.15),
              child: const Icon(Icons.person, size: 48, color: Colors.black54),
            ),
            const SizedBox(height: 17),
            Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 6),
            Text(email, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 6),
            Text(telefono, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.edit, color: kPrimarySwatch),
              title: const Text('Editar perfil'),
              onTap: () {
                // Acción editar perfil
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: kPrimarySwatch),
              title: const Text('Cambiar contraseña'),
              onTap: () {
                // Acción cambiar contraseña
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                // Acción cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}