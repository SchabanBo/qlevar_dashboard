import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../qlevar_dashboard.dart';
import '../controllers/dashboard_controller.dart';

class SidebarView extends GetView<DashboardController> {
  final SidebarWidgets sidebarWidgets;
  SidebarView(this.sidebarWidgets);
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: 400.milliseconds,
          curve: Curves.easeInOut,
          width: controller.withMode(250, 60, 0),
          decoration: BoxDecoration(
            color: controller.colors.sidebar,
          ),
          child: _getItems(),
        ));
  }

  Widget _getItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          controller.withMode(
              sidebarWidgets.header ?? SizedBox(), Container(), Container()),
          const SizedBox(height: 10),
          sidebarWidgets.showSeparator
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 2,
                  color: controller.colors.accent)
              : const SizedBox(),
          _getItemList(),
          sidebarWidgets.footer ?? SizedBox()
        ],
      ),
    );
  }

  Widget _getItemList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sidebarWidgets.items.length,
      itemBuilder: (c, i) => Obx(() => AnimatedContainer(
            duration: 800.milliseconds,
            curve: Curves.easeInOutBack,
            color: controller.pageIndex.value == i
                ? controller.colors.accent
                : Colors.transparent,
            child: controller.mode.value == SidebarMode.Closed
                ? Container()
                : ListTile(
                    title: controller.withMode(
                        Text(
                          sidebarWidgets.items[i].name,
                          style:
                              TextStyle(color: controller.colors.headerItems),
                        ),
                        Container(),
                        Container()),
                    leading: Icon(
                      sidebarWidgets.items[i].icon,
                      color: controller.colors.headerItems,
                    ),
                    onTap: () {
                      controller.pageIndex.value = i;
                      controller.pageHeader.value =
                          sidebarWidgets.items[i].name;
                      if (controller.size.value.isMobile &&
                          controller.mode.value != SidebarMode.Closed) {
                        controller.mode.value = SidebarMode.Closed;
                      }
                    },
                  ),
          )),
    );
  }
}
