import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Datos de ejemplo, esto luego lo traerás de tu backend
  final List<Map<String, dynamic>> fields = [
    {
      'image': 'assets/field1.jpg',
      'name': 'Cancha 1',
      'address': 'Direccion 1',
      'price': 50,
    },
    {
      'image': 'assets/field2.jpg',
      'name': 'Cancha 2',
      'address': 'Direccion 2',
      'price': 60,
    },
    {
      'image': 'assets/field3.jpg',
      'name': 'Cancha 3',
      'address': 'Direccion 3',
      'price': 45,
      //Como hacer el request desde el frontend a un backend
      //Selecciona una cancha, formato json, quiero este end point 
      //20 canchas
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar personalizado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Canchas de futbol',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_outline, size: 28),
                    onPressed: () {
                      // Navegar al perfil
                    },
                  ),
                ],
              ),
            ),
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Busca canchas por nombre o ubicación',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF3EAD7B), size: 32),
                  hintStyle: TextStyle(color: Color(0xFF3EAD7B), fontSize: 22, fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: const Color(0xFFF6FBF9FA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Título "Canchas cercanas"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Canchas cercanas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Lista de canchas
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: fields.length,
                itemBuilder: (context, index) {
                  final field = fields[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        // Imagen de la cancha
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            field['image'],
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Info de la cancha
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                field['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: Color(0xFF18211A),
                                ),
                              ),
                              Text(
                                field['address'],
                                style: TextStyle(
                                  color: Color(0xFF3EAD7B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Precio
                        Text(
                          '\$${field['price']}/hr',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF18211A),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Botón inferior
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF069A6B),
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Acción de reservar cancha
                  },
                  child: const Text(
                    'Reservar cancha',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF6FBF9),
        selectedItemColor: Color(0xFF18211A),
        unselectedItemColor: Color(0xFF3EAD7B),
        iconSize: 40,
        currentIndex: 0,
        onTap: (index) {
          // Navegación entre pantallas
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}