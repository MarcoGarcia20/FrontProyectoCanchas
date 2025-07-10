import 'package:flutter/material.dart';
import '../../core/constants.dart'; // Define colores y textos aquí
import '../../widgets/feature_button.dart';
import '../../widgets/card_horizontal.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Datos simulados para tarjetas
    final habilidades = [
      {
        'titulo': 'Circuito KIA - Villa Morrá',
        'imagen': 'assets/circuito_kia.png',
        'descripcion': '15 al 24 de Noviembre\nVilla Morra - Club de Padel',
      },
      {
        'titulo': 'Copa Blue',
        'imagen': 'assets/copa_blue.png',
        'descripcion': 'Categorías: Caballeros, Damas, Mixto',
      },
      {
        'titulo': 'Copa Juancho Padel',
        'imagen': 'assets/copa_juancho.png',
        'descripcion': 'Categoría: Libre',
      },
    ];

    final lugares = [
      {
        'titulo': 'Villa Morra - Club de Padel',
        'imagen': 'assets/villa_morra.png',
      },
      {'titulo': 'Mburicao Parque Deportivo', 'imagen': 'assets/mburicao.png'},
      {'titulo': 'Padel Center', 'imagen': 'assets/padel_center.png'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior
              Row(
                children: [
                  Icon(Icons.location_on, color: kPrimarySwatch),
                  const SizedBox(width: 4),
                  Text('Cerca mío', style: TextStyle(color: kPrimarySwatch)),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black87),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Saludo y acciones rápidas
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar_default.png'),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¡Hola, Usuario!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '¿Qué hacemos hoy?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Acciones principales (botones grandes)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FeatureButton(
                    iconAsset: 'assets/reserva.png',
                    label: 'Reserva una cancha',
                    onTap: () {
                      Navigator.pushNamed(context, '/reserva');
                    },
                  ),
                  FeatureButton(
                    iconAsset: 'assets/partido.png',
                    label: 'Historial',
                    onTap: () {
                      Navigator.pushNamed(context, '/historial');
                    },
                  ),
                  FeatureButton(
                    iconAsset: 'assets/torneo.png',
                    label: 'Pagos',
                    onTap: () {
                      Navigator.pushNamed(context, '/pagos');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Carrusel de habilidades
              Text(
                'DEMUESTRA TUS HABILIDADES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: habilidades.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) => CardHorizontal(
                    title: habilidades[i]['titulo']!,
                    image: habilidades[i]['imagen']!,
                    description: habilidades[i]['descripcion']!,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Carrusel de lugares
              Text(
                'DESCUBRE LUGARES ÚNICOS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: lugares.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) => CardHorizontal(
                    title: lugares[i]['titulo']!,
                    image: lugares[i]['imagen']!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimarySwatch,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'INICIO'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'RESERVAR'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'HISTORIAL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'PAGOS',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PERFIL'),
        ],
        onTap: (index) {
          final rutas = [
            '/home',
            '/reserva',
            '/historial',
            '/pagos',
            '/perfil-cliente', // Cambia a '/perfil' si tienes una pantalla de perfil de cliente
          ];
          Navigator.pushNamed(context, rutas[index]);
        },
      ),
    );
  }
}
