import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E8), // Light green background
      body: Column(
        children: [
          // Header
          Container(
            height: 280,
            child: Stack(
              children: [
                // Background image
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bprofil.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Green overlay
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF2E7D32).withOpacity(0.85),
                        const Color(0xFF4CAF50).withOpacity(0.85),
                      ],
                    ),
                  ),
                ),
                // Curved bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F5E8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                // Top AppBar
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const Text(
                          'My Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Profile picture
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profil.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Container(
              color: const Color(0xFFE8F5E8),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Alex Johnson',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E2E2E),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildMenuItem(
                            'My Orders',
                            Icons.shopping_bag_outlined,
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            'My addresses',
                            Icons.location_on_outlined,
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            'Promocodes',
                            Icons.local_offer_outlined,
                          ),
                          _buildDivider(),
                          _buildMenuItem(
                            'Share Promocodes',
                            Icons.share_outlined,
                          ),
                          _buildDivider(),
                          _buildMenuItem('FAQs', Icons.help_outline),
                          _buildDivider(),
                          _buildMenuItem(
                            'Logout',
                            Icons.logout_outlined,
                            isLogout: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, {bool isLogout = false}) {
    return InkWell(
      onTap: () async {
        if (isLogout) {
          // Tampilkan dialog konfirmasi
          final confirm = await showDialog<bool>(
            context: Get.context!,
            builder:
                (context) => AlertDialog(
                  title: const Text('Konfirmasi Logout'),
                  content: const Text('Apakah Anda yakin ingin keluar?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
          );

          if (confirm == true) {
            await Supabase.instance.client.auth
                .signOut(); // logout dari supabase
            Get.offAllNamed('/login'); // navigasi ke halaman login
          }
        } else {
          Get.snackbar("Info", "$title ditekan (belum ada aksi)");
        }
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout ? Colors.red : const Color(0xFF666666),
              size: 24,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isLogout ? Colors.red : const Color(0xFF333333),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isLogout ? Colors.red : const Color(0xFF999999),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 1,
      color: const Color(0xFFF0F0F0),
    );
  }
}
