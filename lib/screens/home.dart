import 'package:demo_framkework/screens/stateful_widget.dart';
import 'package:demo_framkework/screens/stateless_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Framework Flutter'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Center(child: Text('Menu')),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blue,
              elevation: 5,
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const StatelessWidgets(), // Navigator to demo stateless widget
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.blue,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Demo Stateless Widget',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const StatefulWidgets(), // Navigator to demo stateless widget
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.blue,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Demo Stateful Widget',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Demo FLutter')),
    );
  }
}
