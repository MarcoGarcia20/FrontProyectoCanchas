import 'indice.dart';

// Clase Cliente que extiende de Indice
class Cliente extends Indice {
  final String nombre;
  final String apellido;
  final String email;
  final String telefono;

  // El DNI es la clave primaria y se pasa al constructor padre
  Cliente({
    required String dni,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
  }) : super(dni);

  // Métodos útiles para serialización/deserialización:
  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        dni: json['dni'],
        nombre: json['nombre'],
        apellido: json['apellido'],
        email: json['email'],
        telefono: json['telefono'],
      );

  Map<String, dynamic> toJson() => {
        'dni': clave,
        'nombre': nombre,
        'apellido': apellido,
        'email': email,
        'telefono': telefono,
      };
}