import 'package:flutter/material.dart';

class EjerciciosScreen extends StatefulWidget {
  const EjerciciosScreen({super.key});

  @override
  State<EjerciciosScreen> createState() => _EjerciciosScreenState();
}

class _EjerciciosScreenState extends State<EjerciciosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Ejercicios'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        children: [
          Text(
            'Ejercicio 1',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Ejercicio 2',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Ejercicio 3',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
