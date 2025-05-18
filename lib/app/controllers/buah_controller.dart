// lib/app/controllers/buah_controller.dart
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/buah_model.dart';

class BuahController extends GetxController {
  final supabase = Supabase.instance.client;

  RxList<BuahModel> daftarBuah = <BuahModel>[].obs;

  Future<void> ambilBuah() async {
    final data = await supabase.from('buah').select();
    daftarBuah.value =
        (data as List).map((item) => BuahModel.fromMap(item)).toList();
  }

  Future<void> tambahBuah(String nama) async {
    await supabase.from('buah').insert({'nama': nama});
    ambilBuah();
  }

  Future<void> hapusBuah(String id) async {
    await supabase.from('buah').delete().eq('id', id);
    ambilBuah();
  }

  Future<void> editBuah(String id, String nama) async {
    await supabase.from('buah').update({'nama': nama}).eq('id', id);
    ambilBuah();
  }
}
