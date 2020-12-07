import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../shared/dashboard_colors.dart';

class DashboardController extends GetxController {
  DashboardController({this.colors});

  final DashboardColors colors;

  final pageIndex = 0.obs;
  final pageHeader = ''.obs;

  final mode = SidebarMode.Opened.obs;
  final Rx<SizingInformation> size = SizingInformation().obs;
  final modeAnimationDone = false.obs;

  @override
  void onInit() {
    super.onInit();
    mode.listen((_) {
      modeAnimationDone.value = false;
    });
    size.listen((s) {
      if (s.isDesktop) {
        mode.value = SidebarMode.Opened;
      } else if (s.isTablet) {
        mode.value = SidebarMode.Fixed;
      } else if (s.isMobile) {
        mode.value = SidebarMode.Closed;
      }
    });
  }

  void chengeSidebarMode() {
    if (mode.value == SidebarMode.Opened) {
      mode.value = SidebarMode.Fixed;
    } else if (mode.value == SidebarMode.Fixed) {
      mode.value = SidebarMode.Closed;
    } else {
      mode.value = SidebarMode.Opened;
    }
    update();
  }

  Widget widgetWithMode(
      {Widget open = const SizedBox(),
      Widget fixed = const SizedBox(),
      Widget close = const SizedBox()}) {
    return withMode(open, fixed, close);
  }

  T withMode<T>(T open, T fixed, T close) {
    if (mode.value == SidebarMode.Opened) {
      return modeAnimationDone.value ? open : fixed;
    } else if (mode.value == SidebarMode.Fixed) {
      return modeAnimationDone.value ? fixed : close;
    }
    return close;
  }

  void onDashboardChildTap() {
    print('object');
    if (size.value.isMobile && mode.value == SidebarMode.Opened) {
      mode.value = SidebarMode.Closed;
    }
  }
}

enum SidebarMode {
  Closed,
  Opened,
  Fixed,
}
