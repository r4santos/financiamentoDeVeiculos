import 'package:flutter/material.dart';
import 'widgets/vehicleWidget.dart';


void main() {
  runApp(const AppFinance());
}

class AppFinance extends StatelessWidget {
  const AppFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financiamento de Veículos',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'Financiamento de Veículos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VehicleWidget(
              name: 'Veículo 1',
              mark: 'HYUNDAI',
              age: 2020,
              KM: 100000,
              price: 100000,
              description: 'Descrição do veículo 1',
              category: 'Categoria 1',
              imageUrl: 'https://via.placeholder.com/150',
              onTap: () {},
            ),
            VehicleWidget(
              name: 'Veículo 2',
              mark: 'FIAT',
              age: 2025,
              KM: 15400,
              price: 200000,
              description: 'Descrição do veículo 2',
              category: 'Categoria 2',
              imageUrl: 'https://via.placeholder.com/150',
              onTap: () {},
            ),
            VehicleWidget(
              name: 'Veículo 3',          
              mark: 'VOLVO',
              age: 2025,
              KM: 25000,
              price: 300000,
              description: 'Descrição do veículo 3',
              category: 'Categoria 3',
              imageUrl: 'https://via.placeholder.com/150',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
