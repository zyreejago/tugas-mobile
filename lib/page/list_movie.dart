// ignore_for_file: use_super_parameters

import 'package:fadvance/core/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_detail.dart'; // Pastikan untuk mengimpor file MovieDetail

class ListMovie extends StatelessWidget {
  const ListMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Akses UserProvider dari Provider
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Film'),
      ),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userProvider.welcomeList.length,
              itemBuilder: (context, index) {
                var movie = userProvider.welcomeList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      movie.image,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        // Menampilkan ikon tanda seru jika gambar tidak dapat dimuat
                        return const Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 50.0,
                        );
                      },
                    ),
                    title: Text(movie.movie),
                    subtitle: Text('Rating: ${movie.rating}'),
                    onTap: () {
                      // Navigasi ke halaman detail film
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(
                            name: movie.movie,
                            rating: movie.rating.toString(),
                            imageUrl: movie.image,
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
