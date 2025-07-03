import 'package:flutter/material.dart';

class VehicleWidget extends StatelessWidget {
  final String name;
  final String brand;
  final int age;
  final int KM;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final VoidCallback onTap;

  const VehicleWidget({
    Key? key,
    required this.name,
    required this.brand,
    required this.age,
    required this.KM,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              imageUrl,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, StackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.devices_other_outlined,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome e marca do produto
                  Text(
                    '$brand $name',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Descrição do produto
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),

                  // Ano do veículo
                  RichText(text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    children: [
                      WidgetSpan(child: Icon(Icons.calendar_month, size: 16, color: Colors.grey[600]),),
                      TextSpan(text: age.toString() + " "),
                      WidgetSpan(child: Icon(Icons.speed, size: 16, color: Colors.grey[600],)),
                      TextSpan(text: KM.toString()),
                    ],
                  )),

                  // Preço do produto
                  Text(
                    'R\$ ${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}