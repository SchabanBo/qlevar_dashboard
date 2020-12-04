import 'package:flutter/cupertino.dart';

class SidebarWidgets {
  final Widget header;
  final List<SidebarItem> items;
  final Widget footer;
  final bool showSeparator;
  SidebarWidgets(
      {this.header,
      @required this.items,
      this.footer,
      this.showSeparator = true});
}

class SidebarItem {
  final String name;
  final TextStyle nameStyle;
  final IconData icon;
  final Widget child;
  SidebarItem(this.name, this.icon, this.child, {this.nameStyle});
}
