// lib/app/models/buah_model.dart
class BuahModel {
  final String id;
  final String nama;
  final String? foto;

  BuahModel({required this.id, required this.nama, this.foto});

  factory BuahModel.fromMap(Map<String, dynamic> map) {
    return BuahModel(id: map['id'], nama: map['nama'], foto: map['foto']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'nama': nama, 'foto': foto};
  }
}
