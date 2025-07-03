import 'package:flutter/material.dart';
import 'vehicle_widget.dart';

// CarWidget herda de VehicleWidget para reutilizar a estrutura base
class CarWidget extends VehicleWidget {
  final int doors;
  final String transmission;

  const CarWidget({
    super.key,
    required super.name,
    required super.price,
    required super.description,
    required super.imageUrl,
    required super.onTap,
    required this.doors,
    required this.transmission,
  });

  @override
  Widget buildSpecificInfo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$doors portas',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            transmission,
            style: TextStyle(
              fontSize: 12,
              color: Colors.green[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
