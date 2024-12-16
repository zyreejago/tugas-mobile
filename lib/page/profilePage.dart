// ignore_for_file: prefer_const_constructors, use_super_parameters


// ignore_for_file: file_names



import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.example.com/your-profile-picture.jpg', // Ganti dengan URL foto profil Anda
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Mohammad Rezzy Al Zamzammi',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Mahasiswa Informatika - Undiksha',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 20),
            Text(
              'Data Diri',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Nama'),
              subtitle: const Text('Mohammad Rezzy Al Zamzammi'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Asal'),
              subtitle: const Text('Jembrana, Negara, Bali'),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Universitas'),
              subtitle: const Text('Universitas Pendidikan Ganesha (Undiksha)'),
            ),
            ListTile(
              leading: const Icon(Icons.engineering),
              title: const Text('Jurusan'),
              subtitle: const Text('Informatika, Semester 5'),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Keterampilan'),
              subtitle: const Text(
                  'HTML, CSS, JavaScript, PHP, Python, C++, React.js, Firebase, MySQL'),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Pencapaian'),
              subtitle: const Text(
                  'Lolos UTBK di Universitas Pendidikan Ganesha setelah gagal di SNBP'),
            ),
          ],
        ),
      ),
    );
  }
}
