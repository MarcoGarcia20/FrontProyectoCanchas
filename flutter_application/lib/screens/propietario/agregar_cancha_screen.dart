import 'package:flutter/material.dart';
import '../../core/constants.dart';

class AgregarCanchaScreen extends StatefulWidget {
  const AgregarCanchaScreen({super.key});

  @override
  State<AgregarCanchaScreen> createState() => _AgregarCanchaScreenState();
}

class _AgregarCanchaScreenState extends State<AgregarCanchaScreen> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String tipo = 'Fútbol 5';
  String estado = 'Disponible';
  // String imagenPath = ''; // Para manejo futuro de imágenes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarySwatch,
        title: const Text('Agregar Cancha', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nombre
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre de la cancha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese un nombre' : null,
                onSaved: (value) => nombre = value ?? '',
              ),
              const SizedBox(height: 18),
              // Tipo
              DropdownButtonFormField<String>(
                value: tipo,
                decoration: const InputDecoration(
                  labelText: 'Tipo',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Fútbol 5', child: Text('Fútbol 5')),
                  DropdownMenuItem(value: 'Fútbol 7', child: Text('Fútbol 7')),
                  DropdownMenuItem(value: 'Padel', child: Text('Padel')),
                  DropdownMenuItem(value: 'Tenis', child: Text('Tenis')),
                  DropdownMenuItem(value: 'Otro', child: Text('Otro')),
                ],
                onChanged: (value) => setState(() => tipo = value ?? 'Fútbol 5'),
              ),
              const SizedBox(height: 18),
              // Estado
              DropdownButtonFormField<String>(
                value: estado,
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Disponible', child: Text('Disponible')),
                  DropdownMenuItem(value: 'En mantenimiento', child: Text('En mantenimiento')),
                  DropdownMenuItem(value: 'No disponible', child: Text('No disponible')),
                ],
                onChanged: (value) => setState(() => estado = value ?? 'Disponible'),
              ),
              const SizedBox(height: 18),
              // Imagen (sólo selector texto por ahora)
              Text('Imagen (funcionalidad opcional aquí)',
                  style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 36),
              // Botón guardar
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimarySwatch,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.save),
                label: const Text('Guardar Cancha', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aquí puedes hacer el POST al backend o actualizar la lista local
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cancha agregada correctamente')),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}