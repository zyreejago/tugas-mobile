import 'package:fadvance/core/models/user_model_pokemon.dart';
import 'package:fadvance/core/service/user_service_pokemon.dart';
import 'package:flutter/material.dart';

class UserProviderPokemon with ChangeNotifier {
  final UserServicePokemon _userService = UserServicePokemon();
  List<Pokemon> _pokemonList = [];
  bool _isLoading = false;

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;

  Future<void> getPokemons(String page) async {
    _isLoading = true;
    notifyListeners();

    try {
      _pokemonList = await _userService.getPokemonWithPage(page);
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching Pokémon: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPokemonById(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      Pokemon? pokemon = await _userService.getPokemonById(id);
      if (pokemon != null) {
    
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching Pokémon by ID: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
