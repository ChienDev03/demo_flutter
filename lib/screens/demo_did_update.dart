import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChildWidget(value: counter),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++; // cha rebuild
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final int value;
  const ChildWidget({super.key, required this.value});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void initState() {
    super.initState();
    print("initState chạy");
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget chạy: old=${oldWidget.value}, new=${widget.value}");
  }

  @override
  Widget build(BuildContext context) {
    return Text("Value: (${widget.value})", style: const TextStyle(fontSize: 24));
  }
}
