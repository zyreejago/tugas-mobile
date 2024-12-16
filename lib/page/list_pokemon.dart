// ignore_for_file: use_super_parameters

import 'package:fadvance/core/provider/user_provider_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pokemon_detail.dart'; // Pastikan Anda mengimpor file detail

class ListPokemon extends StatelessWidget {
  const ListPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Akses UserProvider dari Provider
    var userProvider = Provider.of<UserProviderPokemon>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
      ),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userProvider.pokemonList.length,
              itemBuilder: (context, index) {
                var pokemon = userProvider.pokemonList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(pokemon.imageUrl),
                    title: Text(pokemon.pokemon),
                    subtitle: Text('Type: ${pokemon.type}'),
                    onTap: () {
                      // Navigasi ke halaman detail Pokémon
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonDetail(
                            name: pokemon.pokemon,
                            type: pokemon.type,
                            abilities: pokemon.abilities, // Masih menyertakan abilities
                            imageUrl: pokemon.imageUrl,
                            // Menghilangkan description
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
