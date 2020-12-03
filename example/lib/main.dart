import 'package:flutter/material.dart';
import 'package:qlevar_dashboard/qlevar_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Dashboard(
        colors: DashboardColors(accent: Colors.red),
        appbar: AppBarWidget(
            right: Row(
          children: [
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Icon(Icons.logout, color: Colors.white),
            const SizedBox(width: 20),
          ],
        )),
      ),
    );
  }
}
