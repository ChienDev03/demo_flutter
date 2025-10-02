import 'package:demo_framework/screens/deactivate.dart';
import 'package:demo_framework/screens/stateful_widget.dart';
import 'package:demo_framework/screens/stateless_widgets.dart';
import 'package:flutter/material.dart';

import 'demo_did_update.dart';
import 'did_change_dependence_demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo Framework Flutter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
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
                            const StatefulWidgets(), // Navigator to demo stateful widget
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
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DependenciesDemo(), // Navigator to demo stateful widget
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
                          'Demo did change dependence',
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
                            const Parent(), // Navigator to demo stateful widget
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
                          'Demo did update widget',
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
                            const DemoDeactivateActivate(), // Navigator to demo stateful widget
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
                          'Demo Deactivate',
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
      body: Center(child: Text('Demo Flutter')),
    );
  }
}
