// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class PokemonDetail extends StatelessWidget {
  final String name;
  final String type;
  final List<String> abilities; // List abilities
  final String imageUrl;

  const PokemonDetail({
    Key? key,
    required this.name,
    required this.type,
    required this.abilities,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center( // Memusatkan konten
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Memusatkan secara vertikal
            crossAxisAlignment: CrossAxisAlignment.center, // Memusatkan secara horizontal
            children: [
              Image.network(imageUrl),
              const SizedBox(height: 16.0),
              Text(
                'Type: $type',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center, // Memusatkan teks
              ),
              const SizedBox(height: 8.0),
              Text(
                'Abilities: ${abilities.join(', ')}', // Menggabungkan list menjadi string
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Memusatkan teks
              ),
            ],
          ),
        ),
      ),
    );
  }
}
