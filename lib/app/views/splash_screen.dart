import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fruitystock/app/views/welcome.dart'; // Untuk menggunakan Timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk menunggu 3 detik sebelum beralih ke halaman berikutnya
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gambar latar belakang
          Image.asset(
            'assets/splash.png', // Ganti dengan path gambar Anda
            fit: BoxFit.cover,
          ),
          // Overlay hitam transparan
          Container(
            color: Colors.black.withOpacity(0.5), // Hitam transparan
          ),
          // Konten splash screen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo atau gambar
                Image.asset(
                  'assets/logo_buah.png', // Ganti dengan path logo Anda
                  width: 150, // Atur lebar logo sesuai kebutuhan
                  height: 150, // Atur tinggi logo sesuai kebutuhan
                ),
                SizedBox(height: 10),
                // Menampilkan teks
                Text(
                  "Fruit",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks putih
                  ),
                ),
                Text(
                  "Fresh",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks putih
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
