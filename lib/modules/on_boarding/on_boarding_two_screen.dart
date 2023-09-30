import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/modules/login_screen/login_screen.dart';
import 'package:calendar_app/modules/on_boarding/on_boarding_three_screen.dart';
import 'package:calendar_app/modules/on_boarding/widgets/onboarding_widget.dart';
import 'package:calendar_app/shared/assets.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingTwoScreen extends StatelessWidget {
  const OnBoardingTwoScreen({super.key});

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
          image: Assets.On2,
          text:
              'يهدف التطبيق إلى عرض الخطة الدراسية كل عام وتنبيه المستخدم حول أي حدث مهم وجديد',
          isfirst: false,
          ontapN: () {
            navigatorTo(context, const OnBoardingThreeScreen());
          },
          ontapB: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
