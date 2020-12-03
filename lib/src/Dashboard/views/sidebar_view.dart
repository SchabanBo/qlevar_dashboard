import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class SidebarView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: 400.milliseconds,
          curve: Curves.easeInOut,
          width: controller.withMode(250, 50, 0),
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
          // controller.withMode(
          //     Image.asset(
          //       'assets/images/QlevarLogo.png',
          //       width: 100,
          //     ),
          //     Container(),
          //     Container()),
          const SizedBox(height: 10),
          // Container(
          //   height: 75,
          //   child: _getHeader(),
          // ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 2,
              color: controller.colors.accent),
          // _getListTile(DashboardRoutes.INIT, Icons.dashboard),
          // _getListTile(DashboardRoutes.EMPLOYEE, Icons.person),
          // _getListTile(DashboardRoutes.TABLES, Icons.table_view),
          // _getListTile(DashboardRoutes.MENU, Icons.menu_book),
        ],
      ),
    );
  }

  Widget _getListTile(String route, IconData icon) {
    return Obx(() => AnimatedContainer(
          duration: 800.milliseconds,
          curve: Curves.easeInOutBack,
          color: controller.file == route
              ? controller.colors.accent
              : Colors.transparent,
          child: controller.mode.value == SidebarMode.Closed
              ? Container()
              : ListTile(
                  title: controller.withMode(
                      Text(
                        route,
                        style: TextStyle(
                            color: controller.colors.headerItems),
                      ),
                      Container(),
                      Container()),
                  leading: Icon(
                    icon,
                    color: controller.colors.headerItems,
                  ),
                  onTap: () {
                    controller.file.value = route;
                    if (controller.size.value.isMobile &&
                        controller.mode.value != SidebarMode.Closed) {
                      controller.mode.value = SidebarMode.Closed;
                    }
                  },
                ),
        ));
  }

  // Widget _getHeader() {
  //   final authService = Get.find<IAuthService>();
  //   return FutureBuilder<bool>(
  //       future: authService.isAuthed(),
  //       builder: (_, snapshot) => snapshot.hasData && snapshot.data
  //           ? Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Image.network(
  //                   authService.restaurant.icon,
  //                   fit: BoxFit.fill,
  //                   height: controller.withMode(65, 50, 0),
  //                   width: controller.withMode(65, 50, 0),
  //                 ),
  //                 controller.withMode(
  //                     Text(
  //                       authService.restaurant.name,
  //                       style: TextStyle(color: controller.colors.value.headerItems, fontSize: 17),
  //                     ),
  //                     Container(),
  //                     Container()),
  //               ],
  //             )
  //           : Container());
  //}
}
