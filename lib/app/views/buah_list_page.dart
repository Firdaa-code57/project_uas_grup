// lib/app/views/buah_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/buah_controller.dart';

class BuahListPage extends StatelessWidget {
  final buahC = Get.put(BuahController());
  final namaC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    buahC.ambilBuah();

    return Scaffold(
      appBar: AppBar(title: Text('Data Buah')),
      body: Obx(
        () => ListView.builder(
          itemCount: buahC.daftarBuah.length,
          itemBuilder: (context, index) {
            final buah = buahC.daftarBuah[index];
            return ListTile(
              title: Text(buah.nama),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      namaC.text = buah.nama;
                      showDialog(
                        context: context,
                        builder:
                            (_) => AlertDialog(
                              title: Text('Edit Buah'),
                              content: TextField(controller: namaC),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    buahC.editBuah(buah.id, namaC.text);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Simpan'),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      buahC.hapusBuah(buah.id);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          namaC.clear();
          showDialog(
            context: context,
            builder:
                (_) => AlertDialog(
                  title: Text('Tambah Buah'),
                  content: TextField(controller: namaC),
                  actions: [
                    TextButton(
                      onPressed: () {
                        buahC.tambahBuah(namaC.text);
                        Navigator.pop(context);
                      },
                      child: Text('Tambah'),
                    ),
                  ],
                ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
