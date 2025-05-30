// lib/app/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/simple_buah_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SimpleBuahList(), // tampilkan daftar buah tanpa tombol edit/hapus

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.toNamed('/buah');
              },
              child: Text('Kelola Buah'),
            ),
          ],
        ),
      ),
    );
  }
}
