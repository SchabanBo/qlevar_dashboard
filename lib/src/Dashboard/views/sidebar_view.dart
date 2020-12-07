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
          onEnd: () => controller.modeAnimationDone.value = true,
          duration: 400.milliseconds,
          curve: Curves.easeInOut,
          width: controller.mode.value == SidebarMode.Opened
              ? 250
              : controller.mode.value == SidebarMode.Fixed
                  ? 50
                  : 0,
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
          controller.widgetWithMode(
              open: sidebarWidgets.headerOpen ?? const SizedBox(),
              fixed: sidebarWidgets.headerFixed ?? const SizedBox()),
          const SizedBox(height: 10),        
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
      itemBuilder: (c, i) => Obx(() =>
          controller.mode.value == SidebarMode.Closed ||
                  (controller.mode.value == SidebarMode.Fixed &&
                      !controller.modeAnimationDone.value)
              ? Container()
              : InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          sidebarWidgets.items[i].icon,
                          color: controller.colors.headerItems,
                          size: 25,
                        ),
                        !(controller.mode.value == SidebarMode.Opened &&
                                controller.modeAnimationDone.value)
                            ? Container()
                            : Row(
                                children: [
                                  const SizedBox(width: 15),
                                  Text(
                                    sidebarWidgets.items[i].name,
                                    style: TextStyle(
                                        color: controller.colors.headerItems,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  onTap: () {
                    controller.pageIndex.value = i;
                    if (controller.size.value.isMobile &&
                        controller.mode.value != SidebarMode.Closed) {
                      controller.mode.value = SidebarMode.Closed;
                    }
                  },
                )),
    );
  }
}
