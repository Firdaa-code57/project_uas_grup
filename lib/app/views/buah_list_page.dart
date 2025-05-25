import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/buah_controller.dart';
import 'buah_form_page.dart';

class BuahListPage extends StatelessWidget {
  final BuahController buahController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Buah')),
      body: Obx(() {
        if (buahController.buahList.isEmpty) {
          return Center(child: Text('Belum ada data buah.'));
        }
        return ListView.builder(
          itemCount: buahController.buahList.length,
          itemBuilder: (context, index) {
            final buah = buahController.buahList[index];
            return Card(
              child: ListTile(
                leading:
                    buah.gambarUrl.isNotEmpty
                        ? Image.network(
                          buah.gambarUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                        : Icon(Icons.image_not_supported),
                title: Text(buah.nama),
                subtitle: Text("pcs ${buah.jumlah ?? 0}"),

                // Tambahkan tombol edit dan hapus di sini
                trailing: Row(
                  mainAxisSize:
                      MainAxisSize
                          .min, // Supaya Row tidak mengambil seluruh lebar
                  children: [
                    // Tombol Edit
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(() => BuahFormPage(buah: buah));
                      },
                    ),

                    // Tombol Hapus
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        final confirm = await Get.dialog<bool>(
                          AlertDialog(
                            title: Text('Hapus Buah'),
                            content: Text('Yakin ingin menghapus buah ini?'),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(result: false),
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () => Get.back(result: true),
                                child: Text('Hapus'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await buahController.deleteBuah(
                            buah.id,
                          ); // Panggil fungsi hapus di controller
                          await buahController.fetchBuah(); // Refresh data
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => BuahFormPage()),
        child: Icon(Icons.add),
      ),

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   gapLocation: GapLocation.center,
      //   icons: [Icons.home, Icons.person],
      //   activeIndex: 0,
      //   onTap: (index) {},
      // ),
    );
  }
}
