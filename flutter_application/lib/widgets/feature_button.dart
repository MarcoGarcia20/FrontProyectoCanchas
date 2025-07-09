import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  const FeatureButton({
    required this.iconAsset,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 30,
            child: Image.asset(iconAsset, width: 36, height: 36),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}