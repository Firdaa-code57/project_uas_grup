// lib/app/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authC =
        Get.find<AuthController>(); // Inisialisasi di dalam metode build

    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/buah'); // Navigasi ke halaman kelola buah
              },
              child: Text('Kelola Buah'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authC.logout(); // Memanggil fungsi logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red, // Ganti 'primary' dengan 'backgroundColor'
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
