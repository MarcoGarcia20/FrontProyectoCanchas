import 'indice.dart';

class Propietario extends Indice {
  final String nombre;
  final String email;
  final String telefono;

  Propietario({
    required String id,
    required this.nombre,
    required this.email,
    required this.telefono,
  }) : super(id);

  factory Propietario.fromJson(Map<String, dynamic> json) => Propietario(
        id: json['id'],
        nombre: json['nombre'],
        email: json['email'],
        telefono: json['telefono'],
      );

  Map<String, dynamic> toJson() => {
        'id': clave,
        'nombre': nombre,
        'email': email,
        'telefono': telefono,
      };
}