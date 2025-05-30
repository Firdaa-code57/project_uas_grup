import 'package:get/get.dart';
import '../views/buah_list_page.dart';
import '../controllers/buah_controller.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    if (index == 2) {
      // Daftarkan controller BuahController dulu sebelum navigasi
      if (!Get.isRegistered<BuahController>()) {
        Get.put(BuahController());
      }
      // Kalau tekan Settings, buka BuahListPage tanpa ubah tab
      Get.to(() => BuahListPage());
    } else {
      // Untuk tab lain, ubah selectedIndex seperti biasa
      selectedIndex.value = index;
    }
  }
}
