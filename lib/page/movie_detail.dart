// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final String name;
  final String rating;
  final String imageUrl;

  const MovieDetail({
    Key? key,
    required this.name,
    required this.rating,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center( // Menempatkan konten di tengah
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Untuk scroll jika konten melebihi layar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Mengatur posisi kolom ke tengah
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover, // Menjaga rasio aspek gambar
                  height: 200, // Mengatur tinggi gambar
                  width: double.infinity, // Mengatur lebar gambar agar sesuai dengan lebar kolom
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    // Menampilkan ikon tanda seru jika gambar tidak dapat dimuat
                    return const Icon(
                      Icons.warning,
                      color: Colors.red,
                      size: 50.0,
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Movie: $name',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Memusatkan teks
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Rating: $rating',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, // Memusatkan teks
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
