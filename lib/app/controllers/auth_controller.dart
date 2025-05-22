// lib/app/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user != null) {
        Get.snackbar('Sukses', 'Login berhasil');
        Get.offAllNamed('/home'); // Arahkan ke halaman home
      }
    } catch (e) {
      Get.snackbar('Error', 'Login gagal: $e');
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut(); // Melakukan logout dari Supabase
      Get.snackbar('Sukses', 'Logout berhasil');
      Get.offAllNamed('/login'); // Kembali ke halaman login
    } catch (e) {
      Get.snackbar('Error', 'Logout gagal: $e');
    }
  }
}
