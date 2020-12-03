import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Dashboard/controllers/dashboard_controller.dart';
import 'Dashboard/views/dashboard_view.dart';
import 'app_bar_widgets.dart';
import 'shared/dashboard_colors.dart';

class Dashboard extends StatefulWidget {
  final DashboardColors colors;
  final AppBarWidget appbar;
  Dashboard({this.colors, this.appbar});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    Get.put(DashboardController(colors: widget.colors ?? DashboardColors()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardView(widget.appbar ?? AppBarWidget());
  }
}
