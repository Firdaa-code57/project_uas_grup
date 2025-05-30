import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../routes/app_pages.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/welcome.jpg',
                ), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black transparent overlay
          Container(color: Colors.black.withOpacity(0.5)),
          // Welcome content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50), // Warna hijau
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '''Nikmati kemudahan mengelola stok buah segar langsung dari genggamanmu!
Pantau persediaan buah secara real-time, simpan data dengan aman, dan pastikan setiap buah selalu dalam kondisi terbaik''',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 32),
                // Continue button
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.login); // Navigasi ke halaman login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                      0xFF4CAF50,
                    ), // Warna hijau untuk button
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50), // Ukuran button
                  ),
                  child: Text('Continue to login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
