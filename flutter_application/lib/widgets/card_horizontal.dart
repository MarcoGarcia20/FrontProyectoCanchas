import 'package:flutter/material.dart';

class CardHorizontal extends StatelessWidget {
  final String title;
  final String image;
  final String? description;
  final String? precio;
  final String? disponibilidad;
  final double? rating;

  const CardHorizontal({
    required this.title,
    required this.image,
    this.description,
    this.precio,
    this.disponibilidad,
    this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              width: 170,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(description!,
                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ),
                if (precio != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text('Precio: $precio',
                        style: TextStyle(fontSize: 12, color: Colors.green[800])),
                  ),
                if (disponibilidad != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text('Disponibilidad: $disponibilidad',
                        style: TextStyle(fontSize: 12, color: Colors.blue[700])),
                  ),
                if (rating != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 14),
                        SizedBox(width: 3),
                        Text(rating!.toStringAsFixed(1),
                            style: TextStyle(fontSize: 12, color: Colors.black87)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}