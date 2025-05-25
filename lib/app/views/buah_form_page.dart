import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/buah_controller.dart';
import '../models/buah_model.dart';

class BuahFormPage extends StatefulWidget {
  final Buah? buah;

  const BuahFormPage({this.buah, Key? key}) : super(key: key);

  @override
  State<BuahFormPage> createState() => _BuahFormPageState();
}

class _BuahFormPageState extends State<BuahFormPage> {
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();
  File? _image;
  final _picker = ImagePicker();
  final buahController = Get.find<BuahController>();

  @override
  void initState() {
    super.initState();
    if (widget.buah != null) {
      _namaController.text = widget.buah!.nama;
      _jumlahController.text = (widget.buah!.jumlah ?? 0).toString();
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveBuah() async {
    final nama = _namaController.text.trim();
    final jumlah = int.tryParse(_jumlahController.text.trim()) ?? 0;

    if (nama.isEmpty) {
      Get.snackbar('Error', 'Nama buah harus diisi');
      return;
    }

    if (jumlah <= 0) {
      Get.snackbar('Error', 'jumlah buah harus lebih besar dari 0');
      return;
    }

    if (widget.buah == null) {
      // TAMBAH
      buahController.selectedImage.value = _image;
      await buahController.tambahBuah(nama, jumlah);
    } else {
      // EDIT
      String? gambarUrl;
      if (_image != null) {
        gambarUrl = await buahController.uploadImage(_image!);
      } else {
        gambarUrl = widget.buah!.gambarUrl;
      }
      await buahController.updateBuah(widget.buah!.id, nama, gambarUrl, jumlah);
    }

    await buahController.fetchBuah();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.buah != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Buah' : 'Tambah Buah')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Buah'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _jumlahController,
              decoration: const InputDecoration(labelText: 'Jumlah'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo),
              label: const Text('Pilih Gambar'),
            ),
            const SizedBox(height: 8),
            _image != null
                ? Image.file(_image!, height: 150)
                : widget.buah?.gambarUrl != null
                ? Image.network(widget.buah!.gambarUrl, height: 150)
                : const Text('Belum ada gambar'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _saveBuah,
              icon: const Icon(Icons.save),
              label: Text(isEdit ? 'Update' : 'Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
