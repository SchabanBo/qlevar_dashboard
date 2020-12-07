import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app_bar_widgets.dart';
import '../../sidebar_widgets.dart';
import '../controllers/dashboard_controller.dart';
import 'app_bar_view.dart';
import 'sidebar_view.dart';

class DashboardView extends GetView<DashboardController> {
  final AppBarWidget appbar;
  final SidebarWidgets sidebarWidgets;
  DashboardView(this.appbar, this.sidebarWidgets);
  @override
  Widget build(BuildContext context) {
    controller.pageHeader.value =
        sidebarWidgets.items[controller.pageIndex.value].name;
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (_, size) {
          controller.size.value = size;
          return Row(children: [
            SidebarView(sidebarWidgets),
            Expanded(
              child: Column(
                children: [
                  appbar.useAppBar ? AppBarView(appbar) : Container(),
                  Obx(() => AnimatedSwitcher(
                        duration: Duration(milliseconds: 800),
                        child: sidebarWidgets
                            .items[controller.pageIndex.value].child,
                        switchInCurve: Curves.easeInOutQuint,
                        transitionBuilder: (child, animation) =>
                            _buildFadeTransition(animation, child),
                      )),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }

  FadeTransition _buildFadeTransition(
      Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation),
        child: child,
      ),
    );
  }
}
