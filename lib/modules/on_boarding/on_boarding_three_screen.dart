import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/modules/login_screen/login_screen.dart';
import 'package:calendar_app/modules/on_boarding/widgets/onboarding_widget.dart';
import 'package:calendar_app/shared/assets.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingThreeScreen extends StatelessWidget {
  const OnBoardingThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            navigatorToAndfinish(context, const LoginScreen());
            cache_helper.saveData(key: 'ison', value: true);
          },
          child: Text(
            S.of(context).skip,
            style: TextStyle(
              color: myColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: OnBoardingWidget(
          image: Assets.On3,
          text:
              'يسمح التقويم الدراسي بإدارة معلومات المدرسين والموظفين  بما في ذلك الجداول الزمنية والمهام المسندة والإجازات',
          isfirst: false,
          ontapN: () {
            navigatorToAndfinish(context, const LoginScreen());
            cache_helper.saveData(key: 'ison', value: true);
          },
          ontapB: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
