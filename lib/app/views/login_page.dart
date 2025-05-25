// lib/app/views/login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final authC = Get.put(AuthController());
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailC,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passC,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authC.login(emailC.text, passC.text);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
