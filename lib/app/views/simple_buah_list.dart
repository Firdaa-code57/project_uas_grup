import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/buah_controller.dart';

class SimpleBuahList extends StatelessWidget {
  final BuahController buahController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (buahController.buahList.isEmpty) {
        return Center(child: Text('Belum ada data buah.'));
      }
      return ListView.builder(
        shrinkWrap: true, // supaya bisa dipakai dalam Column/ScrollView lain
        physics: NeverScrollableScrollPhysics(), // supaya tidak scroll sendiri
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
            ),
          );
        },
      );
    });
  }
}
