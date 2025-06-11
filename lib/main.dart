import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruitystock/app/controllers/buah_controller.dart';
import 'package:fruitystock/app/routes/app_pages.dart';
import 'package:fruitystock/app/views/home_page.dart';
import 'package:fruitystock/app/views/notes.dart';
import 'package:fruitystock/app/views/settings.dart';
import 'package:fruitystock/app/views/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vokgxmgvvuhltlljyjba.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZva2d4bWd2dnVobHRsbGp5amJhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc0OTg5MzMsImV4cCI6MjA2MzA3NDkzM30.hZSalFgc6Jaq-GNVDo1L-ZIwwl42_4zQoWnMhkPidjM',
  );

  Get.put(BuahController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stok Buah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
