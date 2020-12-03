import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_bar_widgets.dart';

import '../controllers/dashboard_controller.dart';

class AppBarView extends GetView<DashboardController> {
  final AppBarWidget appbar;
  AppBarView(this.appbar);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: controller.colors.header),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: controller.colors.headerItems),
                onPressed: () => controller.chengeSidebarMode(),
              ),
              const SizedBox(width: 25),
              Obx(() => Text(
                    controller.file.value,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: controller.colors.headerItems,
                      fontSize: 20,
                    ),
                  )),
              appbar.left
            ],
          ),
          Spacer(),
          const SizedBox(width: 30),
          appbar.right
        ],
      ),
    );
  }
}
