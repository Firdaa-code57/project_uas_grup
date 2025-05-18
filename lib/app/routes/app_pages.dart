// lib/app/routes/app_pages.dart
import 'package:get/get.dart';
import '../views/login_page.dart';
import '../views/home_page.dart';
import '../views/buah_list_page.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const buah = '/buah';

  static final routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: buah, page: () => BuahListPage()),
  ];
}
