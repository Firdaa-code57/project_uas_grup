import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  Notes({Key? key}) : super(key: key);

  final List<Map<String, String>> buahNotes = [
    {
      'title': 'Mangga',
      'note':
          'Mangga mengandung vitamin C dan A yang tinggi, membantu meningkatkan daya tahan tubuh dan kesehatan mata.',
    },
    {
      'title': 'Apel',
      'note':
          'Apel kaya akan serat dan antioksidan, membantu pencernaan, menurunkan kolesterol, dan baik untuk jantung.',
    },
    {
      'title': 'Pisang',
      'note':
          'Pisang tinggi kalium yang bermanfaat untuk menjaga tekanan darah dan fungsi otot serta memberikan energi cepat.',
    },
    {
      'title': 'Jeruk',
      'note':
          'Jeruk kaya vitamin C yang membantu meningkatkan sistem kekebalan tubuh dan melawan infeksi.',
    },
    {
      'title': 'Semangka',
      'note':
          'Semangka mengandung banyak air yang membantu menjaga hidrasi dan kaya likopen yang baik untuk kesehatan jantung.',
    },
    {
      'title': 'Anggur',
      'note':
          'Anggur mengandung resveratrol yang baik untuk kesehatan jantung dan membantu melawan peradangan.',
    },
    {
      'title': 'Pepaya',
      'note':
          'Pepaya membantu pencernaan karena kandungan enzim papain dan juga kaya akan vitamin C dan E.',
    },
    {
      'title': 'Kiwi',
      'note':
          'Kiwi mengandung vitamin C lebih tinggi dari jeruk dan baik untuk meningkatkan sistem imun serta kesehatan kulit.',
    },
    {
      'title': 'Nanas',
      'note':
          'Nanas memiliki enzim bromelain yang membantu memecah protein dan mendukung kesehatan pencernaan.',
    },
    {
      'title': 'Alpukat',
      'note':
          'Alpukat mengandung lemak sehat (omega-9) dan vitamin E yang baik untuk jantung dan menjaga kelembapan kulit.',
    },
    {
      'title': 'Stroberi',
      'note':
          'Stroberi kaya antioksidan dan vitamin C yang baik untuk sistem imun dan mencegah kerusakan sel akibat radikal bebas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catatan Buah',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: ListView.builder(
        itemCount: buahNotes.length,
        itemBuilder: (context, index) {
          final item = buahNotes[index];
          return Card(
            margin: const EdgeInsets.all(10),
            color: const Color(0xFFE8F5E9),
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Color(0xFF4CAF50)),
              title: Text(
                item['title'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['note'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
