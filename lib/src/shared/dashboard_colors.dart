import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardColors {
  Color sidebar;
  Color sidebarItems;
  Color header;
  Color headerItems;
  Color accent;

  DashboardColors(
      {this.sidebar = Colors.indigo,
      this.header = Colors.indigo,
      this.accent = Colors.amber,
      this.headerItems = Colors.white,
      this.sidebarItems = Colors.white});
}
