import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/vehicle.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({
    super.key,
    required this.vehicle,
  });

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _downPaymentController = TextEditingController();
  final _termMonthsController = TextEditingController();
  
  double? _financedAmount;
  double? _monthlyPayment;
  bool _calculationPerformed = false;

  @override
  void dispose() {
    _downPaymentController.dispose();
    _termMonthsController.dispose();
    super.dispose();
  }

  void _calculateFinancing() {
    final downPayment = double.tryParse(_downPaymentController.text.replaceAll(',', '.')) ?? 0;
    final termMonths = int.tryParse(_termMonthsController.text) ?? 0;

    if (downPayment < 0 || termMonths <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Insira valores válidos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (downPayment >= widget.vehicle.price) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O pagamento inicial não pode ser maior ou igual ao preço do veículo'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _financedAmount = widget.vehicle.price - downPayment;
      _monthlyPayment = (_financedAmount! / termMonths) * 1.02;
      _calculationPerformed = true;
    });
  }

  Widget _buildInfoChip(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSpecificInfo() {
    final vehicle = widget.vehicle;
    
    if (vehicle is Car) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _buildInfoChip('Portas', '${vehicle.doors}', Colors.blue),
          _buildInfoChip('Transmissão', vehicle.transmission, Colors.green),
        ],
      );
    } else if (vehicle is Motorcycle) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _buildInfoChip('Cilindrada', '${vehicle.displacement}cc', Colors.orange),
          _buildInfoChip('Estilo', vehicle.style, Colors.purple),
        ],
      );
    } else if (vehicle is Truck) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _buildInfoChip('Eixos', '${vehicle.axles}', Colors.red),
          _buildInfoChip('Capacidade de carregamento', '${vehicle.loadCapacity}t', Colors.teal),
        ],
      );
    }
    
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vehicle.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.vehicle.imageUrl,
                height: 450,
                
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            ),
            
            // Nome do veículo
            Text(
              widget.vehicle.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            // Descrição
            Text(
              widget.vehicle.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            
            // Preeço
            Text(
              'R\$ ${widget.vehicle.price.toStringAsFixed(2).replaceAll('.', ',')}',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            
            // Informações específicas do tipo de veículo
            const Text(
              'Especificações:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildSpecificInfo(),
            
            const SizedBox(height: 30),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            
            // Calculadora de financiamento
            const Text(
              'Simular Financiamento',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            
            // Input de valor de entrada
            TextField(
              controller: _downPaymentController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              decoration: const InputDecoration(
                labelText: 'Valor de entrada',
                prefixText: 'R\$ ',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                ),
                labelStyle: TextStyle(color: Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 16),
            
            // Input prazo em meses
            TextField(
              controller: _termMonthsController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'Prazo em meses',
                suffixText: 'meses',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                ),
                labelStyle: TextStyle(color: Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 20),
            
            // Calculate button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculateFinancing,
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            
            // Calcular resultados
            if (_calculationPerformed) ...[
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepOrange.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resultado da simulação:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Valor financiado: R\$ ${_financedAmount!.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pagamento mensal: R\$ ${_monthlyPayment!.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '*  Simulação com taxa de juros fixa de 2% ao mês',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
