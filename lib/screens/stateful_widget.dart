import 'dart:math'; // dùng để random tên
import 'package:flutter/material.dart';

// StatefulWidget để demo vòng đời (life cycle)
class StatefulWidgets extends StatefulWidget {
  const StatefulWidgets({super.key});

  @override
  State<StatefulWidgets> createState() => StatefulWidgetsState();
}

/// State quản lý dữ liệu và UI cho StatefulWidgets
class StatefulWidgetsState extends State<StatefulWidgets>
        /// bạn dùng để đăng ký WidgetsBindingObserver →
        /// giúp theo dõi trạng thái app. Nếu bạn muốn khởi tạo name bằng 1 giá trị từ server,
        /// thì nó sẽ hiển thị ngay khi build.
        with
        WidgetsBindingObserver {
  //tên hiển thị mặc định
  String name = "Nguyễn Văn An";

  // Danh sách tên để random khi bấm nút
  final List<String> names = [
    "Nguyễn Văn An",
    "Trần Thị Bình",
    "Lê Văn Cường",
    "Phạm Thị Dung",
    "Hoàng Văn Em",
    "Vũ Thị Phương",
    "Đỗ Văn Giang",
    "Bùi Thị Hạnh",
    "Ngô Văn Ích",
    "Đặng Thị Kiều",
  ];

  // 1. initState: chạy đầu tiên khi State được tạo
  @override
  void initState() {
    super.initState();
    debugPrint("initState: Widget được tạo");
    // Đăng ký observer để theo dõi vòng đời app (resumed, paused,...)
    WidgetsBinding.instance.addObserver(this);
  }

  // 2. didChangeDependencies: gọi khi widget lần đầu gắn vào cây
  // hoặc khi InheritedWidget mà nó phụ thuộc thay đổi
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies: Dependencies thay đổi");
  }

  // 3. build: nơi xây dựng UI, có thể được gọi nhiều lần
  @override
  Widget build(BuildContext context) {
    debugPrint("build: UI được build");
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Column(
        children: [
          // Phần avatar + thông tin
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/474x/e3/78/7b/e3787b243888f56ae705f0521d7aa0d2.jpg",
                  ),
                ),
                const SizedBox(height: 12),
                // Tên được hiển thị, lấy từ biến name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                // Email cố định
                const Text(
                  "chienhx03.dev@gmail.com",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Nút đổi tên, khi bấm sẽ random tên trong danh sách
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Random index và gán vào biến name
                final random = Random();
                name = names[random.nextInt(names.length)];
              });
              debugPrint("setState: Đổi tên thành $name");
            },
            child: const Text("Đổi tên (Random)"),
          ),

          const Divider(),

          // Danh sách các item trong profile
          Expanded(
            child: ListView(
              children: [
                buildProfileItem(Icons.person, "Thông tin cá nhân"),
                buildProfileItem(Icons.history, "Lịch sử bài test"),
                buildProfileItem(Icons.lock, "Đổi mật khẩu"),
                buildProfileItem(Icons.settings, "Cài đặt"),
                buildProfileItem(Icons.logout, "Đăng xuất"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hàm helper để build ra mỗi item trong danh sách
  Widget buildProfileItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        debugPrint("Tap vào: $title");
      },
    );
  }

  // 4. didUpdateWidget: gọi khi widget cha rebuild và truyền widget mới vào
  @override
  void didUpdateWidget(covariant StatefulWidgets oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget: Widget cha rebuild và truyền widget mới vào");
  }

  // 5. reassemble: chỉ chạy khi hot reload
  @override
  void reassemble() {
    super.reassemble();
    debugPrint("reassemble: Hot reload gọi");
  }

  // 6. didChangeAppLifecycleState: chạy khi app chuyển trạng thái
  // (paused, resumed, inactive, detached)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("didChangeAppLifecycleState: $state");
  }

  // 7. deactivate: gọi khi widget bị remove tạm thời khỏi cây widget
  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate: Widget bị remove tạm thời khỏi cây widget");
  }

  // 8. dispose: gọi khi widget bị hủy
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    debugPrint("dispose: Widget bị destroy");
    super.dispose();
  }
}
