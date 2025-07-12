import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../widgets/feature_button.dart';
import '../../widgets/card_horizontal.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  // Simulación de canchas con distrito
  final List<Map<String, String>> canchas = [
    {
      'titulo': 'Villa Morra - Club de Padel',
      'imagen': 'assets/villa_morra.png',
      'distrito': 'Villa Morra',
    },
    {
      'titulo': 'Mburicao Parque Deportivo',
      'imagen': 'assets/mburicao.png',
      'distrito': 'Mburicao',
    },
    {
      'titulo': 'Padel Center',
      'imagen': 'assets/padel_center.png',
      'distrito': 'Centro',
    },
    {
      'titulo': 'Circuito KIA - Villa Morra',
      'imagen': 'assets/circuito_kia.png',
      'distrito': 'Villa Morra',
    },
    {
      'titulo': 'Copa Blue',
      'imagen': 'assets/copa_blue.png',
      'distrito': 'Centro',
    },
    {
      'titulo': 'Copa Juancho Padel',
      'imagen': 'assets/copa_juancho.png',
      'distrito': 'Mburicao',
    },
  ];

  String? distritoSeleccionado;

  List<String> getDistritos() {
    final setDistritos = canchas.map((c) => c['distrito']!).toSet();
    return setDistritos.toList();
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar canchas por distrito si está seleccionado
    final canchasFiltradas = distritoSeleccionado == null
        ? canchas
        : canchas.where((c) => c['distrito'] == distritoSeleccionado).toList();

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
              // Filtro por distrito
              Row(
                children: [
                  Text(
                    'Filtrar por distrito:',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: distritoSeleccionado,
                    hint: Text('Todos'),
                    items: getDistritos()
                        .map(
                          (distrito) => DropdownMenuItem(
                            value: distrito,
                            child: Text(distrito),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        distritoSeleccionado = value;
                      });
                    },
                  ),
                  if (distritoSeleccionado != null)
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => setState(() {
                        distritoSeleccionado = null;
                      }),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              // Carrusel de canchas cerca de ubicación (todas filtradas)
              Text(
                'Canchas cerca de tu ubicación',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: canchasFiltradas.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final cancha = canchasFiltradas[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/cancha-detalle',
                          arguments: cancha,
                        );
                      },
                      child: CardHorizontal(
                        title: cancha['titulo']!,
                        image: cancha['imagen']!,
                        description: cancha['distrito']!,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Carrusel de todas las canchas
              Text(
                'Todas las canchas disponibles',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: canchas.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final cancha = canchas[i];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/cancha-detalle',
                          arguments: cancha,
                        );
                      },
                      child: CardHorizontal(
                        title: cancha['titulo']!,
                        image: cancha['imagen']!,
                        description: cancha['distrito']!,
                      ),
                    );
                  },
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
            '/perfil-cliente',
          ];
          Navigator.pushNamed(context, rutas[index]);
        },
      ),
    );
  }
}
