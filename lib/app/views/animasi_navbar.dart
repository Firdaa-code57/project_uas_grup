import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../controllers/nav_controller.dart';
import '../views/home_page.dart';
import '../views/notes.dart';
import '../views/settings.dart';
import '../views/profile.dart';

class MyAnimatedBottomNav extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final iconList = [Icons.home, Icons.note, Icons.settings, Icons.person];

  final pages = [HomePage(), Notes(), Settings(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[navController.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4CAF50),
        shape: CircleBorder(),
        child: Icon(Icons.brightness_2, color: Colors.white),
        onPressed: () {
          // Tambahkan aksi saat tombol FAB ditekan
          print("FAB pressed");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: navController.selectedIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          backgroundColor: Color(0xFF4CAF50),
          activeColor: Colors.black,
          inactiveColor: Colors.white,
          iconSize: 28,
          onTap: navController.changeTab,
        ),
      ),
    );
  }
}
