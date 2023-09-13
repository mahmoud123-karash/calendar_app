import 'package:calendar_app/shared/assets.dart';
import 'package:flutter/material.dart';

class HeaderDrawerWidget extends StatelessWidget {
  const HeaderDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.cal2),
            ),
          ),
        ),
      ),
    );
  }
}
