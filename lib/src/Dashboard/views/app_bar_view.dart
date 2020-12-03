import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/dashboard_colors.dart';
import '../controllers/dashboard_controller.dart';

class AppBarView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: DashboardColors.headerColor),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () => controller.chengeSidebarMode(),
              ),
              const SizedBox(width: 25),
              Obx(() => Text(
                    controller.file.value,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
          Spacer(),
          const SizedBox(width: 30),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
