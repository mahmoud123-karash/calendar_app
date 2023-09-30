import 'package:calendar_app/modules/on_boarding/widgets/next_back_widget.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.isfirst,
      required this.ontapN,
      required this.ontapB});
  final String image;
  final String text;
  final bool isfirst;
  final VoidCallback ontapN;
  final VoidCallback ontapB;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width / 1.5,
          height: size.height / 1.7,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: myColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        NextBackWidget(
          isfirst: isfirst,
          ontapB: ontapB,
          ontapN: ontapN,
        )
      ],
    );
  }
}
