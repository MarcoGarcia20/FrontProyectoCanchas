import 'indice.dart';

class Reserva extends Indice {
  final String clienteDni;
  final String canchaId;
  final DateTime fechaHora;
  final double monto;
  final String estado; // pendiente, confirmada, cancelada, etc.

  Reserva({
    required String id,
    required this.clienteDni,
    required this.canchaId,
    required this.fechaHora,
    required this.monto,
    required this.estado,
  }) : super(id);

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        id: json['id'],
        clienteDni: json['clienteDni'],
        canchaId: json['canchaId'],
        fechaHora: DateTime.parse(json['fechaHora']),
        monto: (json['monto'] as num).toDouble(),
        estado: json['estado'],
      );

  Map<String, dynamic> toJson() => {
        'id': clave,
        'clienteDni': clienteDni,
        'canchaId': canchaId,
        'fechaHora': fechaHora.toIso8601String(),
        'monto': monto,
        'estado': estado,
      };
}