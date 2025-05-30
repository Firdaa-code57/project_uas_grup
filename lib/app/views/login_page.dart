// lib/app/views/login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final authC = Get.put(AuthController());
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4CAF50), // Warna latar belakang hijau
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Gambar bulat di atas
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/login.png')),
                ),
              ),
              SizedBox(height: 20),
              // Judul
              Text(
                'Buah Segar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Form login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    // TextField Email/Username
                    TextField(
                      controller: emailC, // <-- tetap gunakan controller lama
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username/Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // TextField Password
                    TextField(
                      controller: passC, // <-- tetap gunakan controller lama
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Tambahkan aksi lupa password jika dibutuhkan
                        },
                        child: Text(
                          'Lupa Kata Sandi?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Tombol Login
                    ElevatedButton(
                      onPressed: () {
                        authC.login(
                          emailC.text,
                          passC.text,
                        ); // <-- logika login lama
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFC107),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Tombol daftar
                    TextButton(
                      onPressed: () {
                        // Tambahkan navigasi ke halaman daftar jika dibutuhkan
                      },
                      child: Text(
                        'Belum punya akun? Daftar Disini',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ], // akhir children Column dalam Padding
                ),
              ), // akhir Padding
            ], // akhir children Column utama
          ),
        ),
      ),
    );
  }
}
