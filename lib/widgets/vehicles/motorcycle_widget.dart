import 'package:flutter/material.dart';
import 'vehicle_widget.dart';

// INHERITANCE: MotorcycleWidget inherits from VehicleWidget to reuse the base structure
class MotorcycleWidget extends VehicleWidget {
  final int displacement;
  final String style;

  const MotorcycleWidget({
    super.key,
    required super.name,
    required super.price,
    required super.description,
    required super.imageUrl,
    required super.onTap,
    required this.displacement,
    required this.style,
  });

  @override
  Widget buildSpecificInfo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${displacement}cc',
            style: TextStyle(
              fontSize: 12,
              color: Colors.orange[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            style,
            style: TextStyle(
              fontSize: 12,
              color: Colors.purple[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}