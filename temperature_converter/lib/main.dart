import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TemperatureConverterPage(),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() => _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  String _selectedConversion = 'F to C';
  final _controller = TextEditingController();
  final List<String> _history = [];

  void _convertTemperature() {
    final input = double.tryParse(_controller.text) ?? 0.0;
    double result;
    String conversionType;

    if (_selectedConversion == 'F to C') {
      result = (input - 32) * 5 / 9;
      conversionType = 'F to C';
    } else {
      result = (input * 9 / 5) + 32;
      conversionType = 'C to F';
    }

    setState(() {
      _history.insert(0, '$conversionType: $input => ${result.toStringAsFixed(2)}');
      if (_history.length > 3) _history.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: _selectedConversion,
                  items: const [
                    DropdownMenuItem(value: 'F to C', child: Text('Fahrenheit to Celsius')),
                    DropdownMenuItem(value: 'C to F', child: Text('Celsius to Fahrenheit')),
                  ],
                  onChanged: (value) => setState(() => _selectedConversion = value!),
                ),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Enter temperature'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _convertTemperature,
                  child: const Text('CONVERT'),
                ),
                const SizedBox(height: 16),
                Text('Converted value (not editable): ${(_selectedConversion == 'F to C'
                    ? (double.tryParse(_controller.text) ?? 0.0 - 32) * 5 / 9
                    : (double.tryParse(_controller.text) ?? 0.0 * 9 / 5) + 32).toStringAsFixed(2)}'),
                const SizedBox(height: 16),
                const Text('History of conversions made in this execution (most recent at the top):'),
                Expanded(
                  child: ListView.builder(
                    itemCount: _history.length,
                    itemBuilder: (context, index) => Text(_history[index]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}