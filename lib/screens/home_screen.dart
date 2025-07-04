import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import '../widgets/vehicles/car_widget.dart';
import '../widgets/vehicles/motorcycle_widget.dart';
import '../widgets/vehicles/truck_widget.dart';
import 'vehicle_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista como os veículos para financiamento
  static final List<Vehicle> _vehicles = [
    Car(
      name: 'Jeep Renegade',
      price: 146990.00,
      description: 'Sport 1.8 4x2 Flex 16V Automático',
      imageUrl:
          'https://mundodoautomovelparapcd.com.br/wp-content/uploads/2024/11/Jeep-Renegade-Longitude-2025.jpg',
      doors: 4,
      transmission: 'Automatic',
    ),
    Motorcycle(
      name: 'Honda CB 300F',
      price: 22000.00,
      description: 'Twister Flex c/ ABS',
      imageUrl:
          'https://cabralmotor.fbitsstatic.net/img/p/cb-300f-twister-abs-70361/257562-1.jpg?w=1000&h=1000&v=202504071330&qs=ignore',
      displacement: 300,
      style: 'Naked',
    ),
    Truck(
      name: 'Volvo FH 540',
      price: 850000.00,
      description: 'Globetrotter 6x4 I-Shift',
      imageUrl:
          'https://dnge9sb91helb.cloudfront.net/imagetilewm/product/52abccd0/volvo-fh540-tridem,3dc3be87.jpg',
      axles: 8,
      loadCapacity: 48.5,
    ),
    Car(
      name: 'Fiat Cronos',
      price: 92990.00,
      description: '1.3 Firefly Flex Drive S-Design',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Fiat_Cronos_1.8_16V_E.Torq_Precision.jpg/960px-Fiat_Cronos_1.8_16V_E.Torq_Precision.jpg',
      doors: 4,
      transmission: 'Manual',
    ),
  ];

  void _navigateToDetails(BuildContext context, Vehicle vehicle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleDetailsScreen(vehicle: vehicle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veículos para Financiamento'),
        centerTitle: true,
      ),
      body: GridView.builder(
      // É uma boa prática usar GridView.builder para listas, pois ele constrói os itens sob demanda.
      padding: const EdgeInsets.all(8.0), // Padding em todas as direções
      itemCount: _vehicles.length, // <-- PONTO CHAVE: Informa a quantidade de itens
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,         // Exibe 4 colunas.
        crossAxisSpacing: 8.0,     // Espaçamento horizontal entre os itens
        mainAxisSpacing: 8.0,      // Espaçamento vertical entre os itens
        childAspectRatio: 1.2,     // Ajusta a proporção (largura / altura). Experimente valores diferentes.
      ),
        itemBuilder: (context, index) {
          final vehicle = _vehicles[index];

          // Instanciar o widget correspondente com base no tipo de veículo
          if (vehicle is Car) {
            return CarWidget(
              name: vehicle.name,
              price: vehicle.price,
              description: vehicle.description,
              imageUrl: vehicle.imageUrl,
              doors: vehicle.doors,
              transmission: vehicle.transmission,
              onTap: () => _navigateToDetails(context, vehicle),
            );
          } else if (vehicle is Motorcycle) {
            return MotorcycleWidget(
              name: vehicle.name,
              price: vehicle.price,
              description: vehicle.description,
              imageUrl: vehicle.imageUrl,
              displacement: vehicle.displacement,
              style: vehicle.style,
              onTap: () => _navigateToDetails(context, vehicle),
            );
          } else if (vehicle is Truck) {
            return TruckWidget(
              name: vehicle.name,
              price: vehicle.price,
              description: vehicle.description,
              imageUrl: vehicle.imageUrl,
              axles: vehicle.axles,
              loadCapacity: vehicle.loadCapacity,
              onTap: () => _navigateToDetails(context, vehicle),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
