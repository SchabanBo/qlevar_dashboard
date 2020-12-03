import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../shared/dashboard_colors.dart';

class DashboardController extends GetxController {
  DashboardController({this.colors});

  final DashboardColors colors;

  final file = ''.obs;

  final mode = SidebarMode.Opened.obs;
  final Rx<SizingInformation> size = SizingInformation().obs;

  @override
  void onInit() {
    super.onInit();
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

  T withMode<T>(T open, T fixed, T colse) {
    if (mode.value == SidebarMode.Opened) {
      return open;
    } else if (mode.value == SidebarMode.Fixed) {
      return fixed;
    }
    return colse;
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
