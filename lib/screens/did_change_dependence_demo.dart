import 'package:flutter/material.dart';

class DependenciesDemo extends StatefulWidget {
  const DependenciesDemo({super.key});

  @override
  State<DependenciesDemo> createState() => _DependenciesDemoState();
}

class _DependenciesDemoState extends State<DependenciesDemo> {
  Color? bgColor;

  @override
  void initState() {
    super.initState();
    bgColor = Colors.white;
    debugPrint("initState() gọi");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies() gọi");
    // Ví dụ: lấy kích thước màn hình từ MediaQuery
    final size = MediaQuery.of(context).size;
    final color = bgColor;
    debugPrint("Kích thước màn hình: $size");
    debugPrint("Màu: $color");
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint("🔥 reassemble() gọi sau hot reload");
    // Cập nhật lại dependency từ Theme
    setState(() {
      bgColor = Colors.yellow;
      print(bgColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build() gọi");
    return Scaffold(
      appBar: AppBar(title: const Text("reassemble Demo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: bgColor,
          child: const Center(
            child: Text(
              "Đổi ThemeData.primarySwatch và hot reload để test",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
