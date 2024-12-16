// ignore_for_file: use_super_parameters, use_build_context_synchronously

import 'package:fadvance/core/provider/user_provider.dart';
import 'package:fadvance/core/provider/user_provider_pokemon.dart';
import 'package:fadvance/page/list_movie.dart'; // Pastikan import file ListMovie
import 'package:fadvance/page/list_pokemon.dart'; // Pastikan import file ListPokemon
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Akses MovieProvider dan PokemonProvider secara terpisah
    var movieProvider = Provider.of<UserProvider>(context);
    var pokemonProvider = Provider.of<UserProviderPokemon>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigasi ke halaman ProfilePage
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Latar belakang putih
        padding: const EdgeInsets.all(16.0), // Padding untuk konten
        child: Column(
          children: [
            const SizedBox(height: 20), // Jarak vertikal di bawah AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Jarak horizontal antar tombol
                    child: ElevatedButton(
                      onPressed: () async {
                        // Memuat data movie menggunakan MovieProvider
                        await movieProvider.getWelcome("1");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListMovie(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(150, 150), // Ukuran tombol persegi besar
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Sudut melengkung
                        ),
                        backgroundColor:
                            Colors.blueAccent, // Warna latar belakang tombol
                      ),
                      child: const Text(
                        'Movie',
                        style: TextStyle(fontSize: 24), // Ukuran teks besar
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Jarak horizontal antar tombol
                    child: ElevatedButton(
                      onPressed: () async {
                        // Memuat data pokemon menggunakan PokemonProvider
                        await pokemonProvider.getPokemons("1");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListPokemon(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(150, 150), // Ukuran tombol persegi besar
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Sudut melengkung
                        ),
                        backgroundColor:
                            Colors.greenAccent, // Warna latar belakang tombol
                      ),
                      child: const Text(
                        'Pokemon',
                        style: TextStyle(fontSize: 24), // Ukuran teks besar
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Spasi antara tombol dan deskripsi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore movies and Pokemons, each offering unique experiences. '
                'Choose one and dive into the world of entertainment or adventure!',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
