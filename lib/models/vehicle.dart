abstract class Vehicle {
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  const Vehicle({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

class Car extends Vehicle {
  final int doors;
  final String transmission;

  const Car({
    required super.name,
    required super.price,
    required super.description,
    required super.imageUrl,
    required this.doors,
    required this.transmission,
  });
}

class Motorcycle extends Vehicle {
  final int displacement;
  final String style;

  const Motorcycle({
    required super.name,
    required super.price,
    required super.description,
    required super.imageUrl,
    required this.displacement,
    required this.style,
  });
}

class Truck extends Vehicle {
  final int axles;
  final double loadCapacity;

  const Truck({
    required super.name,
    required super.price,
    required super.description,
    required super.imageUrl,
    required this.axles,
    required this.loadCapacity,
  });
}