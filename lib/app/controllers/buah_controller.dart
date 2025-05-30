// lib/app/controllers/buah_controller.dart
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/buah_model.dart';
import 'package:uuid/uuid.dart';

class BuahController extends GetxController {
  final supabase = Supabase.instance.client;
  var buahList = <Buah>[].obs;
  var selectedImage = Rxn<File>();

  @override
  void onInit() {
    fetchBuah();
    super.onInit();
  }

  Future<void> fetchBuah() async {
    final response = await supabase.from('buah').select();
    buahList.value =
        (response as List)
            .map((item) => Buah.fromJson(item as Map<String, dynamic>))
            .toList();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  Future<String> uploadImage(File imageFile) async {
    final fileExt = imageFile.path.split('.').last;
    final fileName = '${const Uuid().v4()}.$fileExt';
    final filePath = 'buah/$fileName';

    await supabase.storage.from('gambar-buah').upload(filePath, imageFile);
    final imageUrl = supabase.storage
        .from('gambar-buah')
        .getPublicUrl(filePath);
    return imageUrl;
  }

  Future<void> tambahBuah(String nama, int quantity) async {
    String gambarUrl = '';
    if (selectedImage.value != null) {
      gambarUrl = await uploadImage(selectedImage.value!);
    }
    final id = const Uuid().v4();
    await supabase.from('buah').insert({
      'id': id,
      'nama': nama,
      'gambar_url': gambarUrl,
      'jumlah': quantity,
    });
    selectedImage.value = null;
    fetchBuah();
  }

  Future<void> updateBuah(
    String id,
    String nama,
    String? gambarUrl,
    int quantity,
  ) async {
    final response = await Supabase.instance.client
        .from('buah')
        .update({'nama': nama, 'gambar_url': gambarUrl, 'jumlah': quantity})
        .eq('id', id);

    if (response != null) fetchBuah();
  }

  Future<void> deleteBuah(String id) async {
    final response = await Supabase.instance.client
        .from('buah')
        .delete()
        .eq('id', id);

    if (response != null) fetchBuah();
  }
}
