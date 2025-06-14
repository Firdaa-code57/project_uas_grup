import 'package:get/get.dart';
import '../controllers/buah_controller.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    // Pastikan BuahController terdaftar saat tab ke BuahListPage diakses
    if (index == 2 && !Get.isRegistered<BuahController>()) {
      Get.put(BuahController());
    }

    selectedIndex.value = index; // Jangan pakai Get.to
  }
}
