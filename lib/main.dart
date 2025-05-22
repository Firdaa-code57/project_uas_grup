import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas_grup/app/views/login_page.dart';
import 'package:project_uas_grup/app/views/home_page.dart'; // Pastikan untuk mengimpor HomePage
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vokgxmgvvuhltlljyjba.supabase.co', // Ganti dengan Project URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZva2d4bWd2dnVobHRsbGp5amJhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc0OTg5MzMsImV4cCI6MjA2MzA3NDkzM30.hZSalFgc6Jaq-GNVDo1L-ZIwwl42_4zQoWnMhkPidjM', // Ganti dengan Anon Key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stok Buah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: AppRoutes.routes,
      initialRoute:
          AppRoutes.login, // Pastikan ini sesuai dengan rute login Anda
    );
  }
}
