// lib/app/models/buah_model.dart
class Buah {
  final String id;
  final String nama;
  final String gambarUrl;

  Buah({required this.id, required this.nama, required this.gambarUrl});

  factory Buah.fromJson(Map<String, dynamic> json) {
    return Buah(
      id: json['id'],
      nama: json['nama'],
      gambarUrl: json['gambar_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nama': nama, 'gambar_url': gambarUrl};
  }
}
