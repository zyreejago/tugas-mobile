// ignore_for_file: use_super_parameters

import 'package:fadvance/page/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fadvance/core/provider/user_provider_pokemon.dart';
import 'package:fadvance/core/provider/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()), // Provider untuk movie
        ChangeNotifierProvider(create: (_) => UserProviderPokemon()), // Provider untuk pokemon
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewScreen(), // Halaman utama
    );
  }
}
