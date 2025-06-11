// lib/app/routes/app_pages.dart
import 'package:get/get.dart';
import '../views/splash_screen.dart';
import '../views/welcome.dart';
import '../views/login_page.dart';
import '../views/buah_list_page.dart';
import '../views/buah_form_page.dart';
import '../views/animasi_navbar.dart';
import '../views/register_page.dart';

class AppRoutes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const buah = '/buah';
  static const tambahBuah = '/tambah-buah';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => RegisterPage()),
    GetPage(name: home, page: () => MyAnimatedBottomNav()),
    GetPage(name: buah, page: () => BuahListPage()),
    GetPage(name: tambahBuah, page: () => BuahFormPage()),
  ];
}
