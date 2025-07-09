import 'indice.dart';

class Pago extends Indice {
  final String reservaId;
  final double monto;
  final String metodo; // Ej: Yape, Plin, Tarjeta
  final DateTime fecha;

  Pago({
    required String id,
    required this.reservaId,
    required this.monto,
    required this.metodo,
    required this.fecha,
  }) : super(id);

  factory Pago.fromJson(Map<String, dynamic> json) => Pago(
        id: json['id'],
        reservaId: json['reservaId'],
        monto: (json['monto'] as num).toDouble(),
        metodo: json['metodo'],
        fecha: DateTime.parse(json['fecha']),
      );

  Map<String, dynamic> toJson() => {
        'id': clave,
        'reservaId': reservaId,
        'monto': monto,
        'metodo': metodo,
        'fecha': fecha.toIso8601String(),
      };
}