import 'package:flutter/cupertino.dart';

class AppBarWidget {
  final bool useAppBar;
  final Widget left;
  final Widget right;
  AppBarWidget(
      {this.useAppBar = true,
      this.left = const SizedBox(),
      this.right = const SizedBox()});
}
