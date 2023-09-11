import 'package:calendar_app/layout/widgets/menu_widget.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(
      {super.key,
      required this.isdark,
      required this.mainScrenn,
      required this.zoomDrawerController});

  final bool isdark;
  final Widget mainScrenn;
  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ZoomDrawer(
      menuBackgroundColor: isdark ? blackColor : Colors.white,
      isRtl: true,
      controller: zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuWidget(size: size),
      mainScreen: mainScrenn,
      borderRadius: 24.0,
      showShadow: true,
      angle: -15.0,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      slideWidth: size.width * .80,
      openCurve: Curves.fastOutSlowIn,
      clipMainScreen: true,
      closeCurve: Curves.bounceIn,
    );
  }
}
