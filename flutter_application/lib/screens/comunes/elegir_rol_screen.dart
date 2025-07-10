import 'package:flutter/material.dart';

class EligeRolScreen extends StatelessWidget {
  const EligeRolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 249, 249),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo sobre fondo verde circular
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade200,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Hero(
                  tag: 'logoHero',
                  child: Image.asset(
                    'assets/logo-FII-blanco.png',
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '¿Cómo deseas ingresar?',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                    arguments: 'cliente',
                  );
                },
                child: const Text(
                  'Quiero alquilar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  side: BorderSide(color: Colors.green.shade700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                    arguments: 'propietario',
                  );
                },
                child: Text(
                  'Soy propietario',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}