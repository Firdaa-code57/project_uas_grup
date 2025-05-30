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
          // Panggil widget buildBuahItem, pastikan buah adalah Map/Model sesuai kebutuhan
          return buildBuahItem({
            'nama': buah.nama,
            'jumlah': buah.jumlah,
            'gambarUrl': buah.gambarUrl,
          });
        },
      );
    });
  }
}

// widget item buah sesuai template
Widget buildBuahItem(Map<String, dynamic> buah) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  buah['gambarUrl'] != null && buah['gambarUrl'].isNotEmpty
                      ? Image.network(buah['gambarUrl'], fit: BoxFit.cover)
                      : Icon(Icons.image_not_supported),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  buah['nama'] ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Jumlah: ${buah['jumlah'] ?? 0} pcs",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Misal harga tidak ada, bisa dihilangkan atau tambahkan sesuai data
                    Text(
                      '', // Kosong jika tidak ada harga
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
