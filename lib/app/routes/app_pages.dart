// lib/app/routes/app_pages.dart
import 'package:get/get.dart';
import '../views/login_page.dart';
import '../views/home_page.dart';
import '../views/buah_list_page.dart';
import '../views/buah_form_page.dart';
import '../controllers/buah_controller.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const buah = '/buah';
  static const tambahBuah = '/tambah-buah';

  static final routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(
      name: buah,
      page: () => BuahListPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => BuahController());
      }),
    ),
    GetPage(name: tambahBuah, page: () => BuahFormPage()),
  ];
}
