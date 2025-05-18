// lib/app/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/buah');
          },
          child: Text('Kelola Buah'),
        ),
      ),
    );
  }
}
