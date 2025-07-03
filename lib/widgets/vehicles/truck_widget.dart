import 'package:flutter/material.dart';
import 'vehicle_widget.dart';

// TruckWidget herda de VehicleWidget para reutilizar a estrutura base
class TruckWidget extends VehicleWidget {
  final int axles;
  final double loadCapacity;

  const TruckWidget({
    super.key,
    required super.name,
    required super.price,
    required super.description,
    required super.imageUrl,
    required super.onTap,
    required this.axles,
    required this.loadCapacity,
  });

  @override
  Widget buildSpecificInfo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$axles eixos',
            style: TextStyle(
              fontSize: 12,
              color: Colors.red[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.teal[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${loadCapacity}t',
            style: TextStyle(
              fontSize: 12,
              color: Colors.teal[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}