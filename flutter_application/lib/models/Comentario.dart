import 'indice.dart';

class Comentario extends Indice {
  final String canchaId;
  final String clienteDni;
  final String texto;
  final int calificacion; // 1-5 estrellas
  final DateTime fecha;

  Comentario({
    required String id,
    required this.canchaId,
    required this.clienteDni,
    required this.texto,
    required this.calificacion,
    required this.fecha,
  }) : super(id);

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        id: json['id'],
        canchaId: json['canchaId'],
        clienteDni: json['clienteDni'],
        texto: json['texto'],
        calificacion: json['calificacion'],
        fecha: DateTime.parse(json['fecha']),
      );

  Map<String, dynamic> toJson() => {
        'id': clave,
        'canchaId': canchaId,
        'clienteDni': clienteDni,
        'texto': texto,
        'calificacion': calificacion,
        'fecha': fecha.toIso8601String(),
      };
}