// lib/app/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fruitystock/app/controllers/buah_controller.dart';
import 'package:get/get.dart';
import '../views/simple_buah_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // Pastikan controller sudah diinisialisasi sebelum digunakan
      Get.find<BuahController>().fetchBuah();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF4CAF50),
      ),
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
