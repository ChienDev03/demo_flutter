import 'package:flutter/material.dart';

class DemoDeactivateActivate extends StatefulWidget {
  const DemoDeactivateActivate({super.key});

  @override
  State<DemoDeactivateActivate> createState() => _DemoDeactivateActivateState();
}

class _DemoDeactivateActivateState extends State<DemoDeactivateActivate> {
  bool showBlue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo deactivate")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showBlue) const BlueBox(),
            const RedBox(), // luôn nằm trên
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showBlue = !showBlue;
          });
        },
        child: Icon(showBlue ? Icons.remove : Icons.add),
      ),
    );
  }
}

class BlueBox extends StatefulWidget {
  const BlueBox({super.key});

  @override
  State<BlueBox> createState() => _BlueBoxState();
}

class _BlueBoxState extends State<BlueBox> {
  @override
  void initState() {
    super.initState();
    print("BlueBox initState()");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("BlueBox deactivate()");
  }

  @override
  void dispose() {
    super.dispose();
    print("BlueBox dispose()");
  }

  @override
  Widget build(BuildContext context) {
    print("BlueBox build()");
    return Container(width: 150, height: 150, color: Colors.blue);
  }
}

class RedBox extends StatefulWidget {
  const RedBox({super.key});

  @override
  State<RedBox> createState() => _RedBoxState();
}

class _RedBoxState extends State<RedBox> {
  @override
  void initState() {
    super.initState();
    print("RedBox initState()");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("RedBox deactivate()");
  }

  @override
  void activate() {
    super.activate();
    print("RedBox activate()");
  }

  @override
  void dispose() {
    super.dispose();
    print("RedBox dispose()");
  }

  @override
  Widget build(BuildContext context) {
    print("RedBox build()");
    return Container(width: 100, height: 100, color: Colors.red);
  }
}
