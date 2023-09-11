import 'package:calendar_app/shared/assets.dart';
import 'package:flutter/material.dart';

class HeaderDrawerWidget extends StatelessWidget {
  const HeaderDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: const EdgeInsets.all(10),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.cal2),
          ),
        ),
      ),
    );
  }
}
