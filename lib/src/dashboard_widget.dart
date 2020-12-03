import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Dashboard/controllers/dashboard_controller.dart';
import 'Dashboard/views/dashboard_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    Get.put(DashboardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardView();
  }
}
