import 'package:flutter/material.dart';

class StatelessWidgets extends StatelessWidget {
  const StatelessWidgets({super.key});

  // Hàm build 1 item cho gọn code
  Widget buildProfileItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: () => print(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Column(
        children: [
          // Avatar + Info
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://jbagy.me/wp-content/uploads/2025/03/anh-avatar-anime-trang-den-girl-1.jpg",
                  ), // avatar demo
                ),
                SizedBox(height: 12),
                Text(
                  "Hồ Xuân Chiến",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  "chienhx03.dev@gmail.com",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Danh sách items
          Expanded(
            child: ListView(
              children: [
                buildProfileItem(
                  icon: Icons.person,
                  title: "Thông tin cá nhân",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Đi tới Thông tin cá nhân")),
                    );
                  },
                ),
                buildProfileItem(
                  icon: Icons.history,
                  title: "Lịch sử bài test",
                ),
                buildProfileItem(icon: Icons.lock, title: "Đổi mật khẩu"),
                buildProfileItem(icon: Icons.settings, title: "Cài đặt"),
                buildProfileItem(icon: Icons.logout, title: "Đăng xuất"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
