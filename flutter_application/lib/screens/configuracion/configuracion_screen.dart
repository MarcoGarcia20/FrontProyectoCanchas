import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Configuración',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: kPrimarySwatch.withOpacity(0.2),
              child: const Icon(Icons.person, color: Colors.black87),
            ),
            title: const Text('Mi perfil'),
            subtitle: const Text('Ver y editar información personal'),
            onTap: () {
              // Navega a editar perfil
            },
          ),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: kPrimarySwatch.withOpacity(0.2),
              child: const Icon(Icons.notifications, color: Colors.black87),
            ),
            title: const Text('Notificaciones'),
            subtitle: const Text('Preferencias de notificación'),
            onTap: () {
              // Navega a preferencias de notificaciones
            },
          ),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: kPrimarySwatch.withOpacity(0.2),
              child: const Icon(Icons.dark_mode, color: Colors.black87),
            ),
            title: const Text('Tema'),
            subtitle: const Text('Claro / Oscuro'),
            onTap: () {
              // Cambia el tema de la app
            },
          ),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: kPrimarySwatch.withOpacity(0.2),
              child: const Icon(Icons.help_outline, color: Colors.black87),
            ),
            title: const Text('Ayuda y soporte'),
            subtitle: const Text('Preguntas frecuentes y contacto'),
            onTap: () {
              // Navega a ayuda o soporte
            },
          ),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.15),
              child: const Icon(Icons.logout, color: Colors.redAccent),
            ),
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              // Lógica para cerrar sesión
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Cerrar sesión"),
                  content: const Text("¿Estás seguro de que deseas salir?"),
                  actions: [
                    TextButton(
                      child: const Text("Cancelar"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: const Text("Salir"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Aquí navega a login u otra pantalla
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}