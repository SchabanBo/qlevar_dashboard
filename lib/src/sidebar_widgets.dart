import 'package:flutter/cupertino.dart';

class SidebarWidgets {
  final Widget headerOpen;
  final Widget headerFixed;
  final List<SidebarItem> items;
  final Widget footer;
  SidebarWidgets(
      {this.headerOpen, this.headerFixed, @required this.items, this.footer});
}

class SidebarItem {
  final String name;
  final TextStyle nameStyle;
  final IconData icon;
  final Widget child;
  SidebarItem(this.name, this.icon, this.child, {this.nameStyle});
}
