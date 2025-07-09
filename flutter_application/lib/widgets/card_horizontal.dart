import 'package:flutter/material.dart';

class CardHorizontal extends StatelessWidget {
  final String title;
  final String image;
  final String? description;

  const CardHorizontal({
    required this.title,
    required this.image,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
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
              width: 140,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(description!,
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
            ),
        ],
      ),
    );
  }
}