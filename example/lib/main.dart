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
        colors: DashboardColors(accent: Colors.green),
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
        sidebarWidgets: SidebarWidgets(
            header: Text(
              'My Cool Store',
              style: TextStyle(fontSize: 18),
            ),
            items: [
              SidebarItem('Dashboard', Icons.dashboard, _getChild('Dashboard')),
              SidebarItem('Orders', Icons.account_box, _getChild('Orders')),
              SidebarItem('Customers', Icons.person, _getChild('Customers')),
              SidebarItem('Items', Icons.opacity, _getChild('Items')),
              SidebarItem('Cash', Icons.money, _getChild('Cash')),
            ]),
      ),
    );
  }

  Widget _getChild(String name) {
    return Center(
      child: Text(name),
    );
  }
}
