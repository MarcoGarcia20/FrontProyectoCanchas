import 'indice.dart';

class Cancha extends Indice {
  final String nombre;
  final String tipo;
  final String ubicacion;
  final double precio;
  final String fotoUrl;
  final String propietarioId;
  final List<String> horariosDisponibles;

  Cancha({
    required String id,
    required this.nombre,
    required this.tipo,
    required this.ubicacion,
    required this.precio,
    required this.fotoUrl,
    required this.propietarioId,
    required this.horariosDisponibles,
  }) : super(id);

  factory Cancha.fromJson(Map<String, dynamic> json) => Cancha(
        id: json['id'],
        nombre: json['nombre'],
        tipo: json['tipo'],
        ubicacion: json['ubicacion'],
        precio: (json['precio'] as num).toDouble(),
        fotoUrl: json['fotoUrl'],
        propietarioId: json['propietarioId'],
        horariosDisponibles:
            List<String>.from(json['horariosDisponibles'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': clave,
        'nombre': nombre,
        'tipo': tipo,
        'ubicacion': ubicacion,
        'precio': precio,
        'fotoUrl': fotoUrl,
        'propietarioId': propietarioId,
        'horariosDisponibles': horariosDisponibles,
      };
}