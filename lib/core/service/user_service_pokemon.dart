// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fadvance/core/models/user_model_pokemon.dart';

class UserServicePokemon {
  final Dio _dio = Dio();

  Future<List<Pokemon>> getPokemon() async {
    try {
      final response = await _dio.get(
          'https://dummyapi.online/api/pokemon'); // Ganti dengan URL API yang sesuai
      // Cek status respons
      if (response.statusCode == 200) {
        print('Data received: ${response.data}'); // Tambahkan untuk debugging
        return welcomeFromJson(
            response.data); // Menggunakan response.data secara langsung
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching Pokémon: $e');
      return [];
    }
  }

  Future<Pokemon?> getPokemonById(int id) async {
    try {
      final response = await _dio.get(
          'https://dummyapi.online/api/pokemon/$id'); // Ganti dengan URL API yang sesuai
      // Cek status respons
      if (response.statusCode == 200) {
        return Pokemon.fromJson(response
            .data); // Mengonversi data yang diterima langsung menjadi objek Pokemon
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching Pokémon by ID: $e');
      return null;
    }
  }

  Future<List<Pokemon>> getPokemonWithPage(String page) async {
    try {
      final response = await _dio.get(
          'https://dummyapi.online/api/pokemon'); // Menggunakan parameter halaman
      // Cek status respons
      if (response.statusCode == 200) {
        print('Data diterima: ${response.data}'); // Tambahkan untuk debugging
        // Cek apakah response.data adalah list
        if (response.data is List) {
          return List<Pokemon>.from(
              response.data.map((x) => Pokemon.fromJson(x)));
        } else {
          print('Expected List, but got: ${response.data}');
          return [];
        }
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching Pokémon with page: $e');
      return [];
    }
  }
}
