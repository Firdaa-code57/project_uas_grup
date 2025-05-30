// lib/app/models/buah_model.dart
class Buah {
  final String id;
  final String nama;
  final String gambarUrl;
  final int? jumlah;

  Buah({
    required this.id,
    required this.nama,
    required this.gambarUrl,
    required this.jumlah,
  });

  factory Buah.fromJson(Map<String, dynamic> json) {
    return Buah(
      id: json['id'],
      nama: json['nama'],
      gambarUrl: json['gambar_url'] ?? '',
      jumlah: json['jumlah'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nama': nama, 'gambar_url': gambarUrl, 'jumlah': jumlah};
  }
}
