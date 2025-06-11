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
        Get.offAllNamed('/home');
        // Arahkan ke halaman home nanti
      }
    } catch (e) {
      Get.snackbar('Error', 'Login gagal: $e');
    }
  }

  // EDIT: ubah return type jadi Future<bool> dan kembalikan true/false sesuai hasil pendaftaran
  Future<bool> register(String email, String password) async {
    try {
      final res = await supabase.auth.signUp(email: email, password: password);

      if (res.user != null) {
        // Jangan panggil Get.back() di sini
        return true;
      } else {
        Get.snackbar('Info', 'Cek email kamu untuk verifikasi');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Pendaftaran gagal: $e');
      return false;
    }
  }
}
