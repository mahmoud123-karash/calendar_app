import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class NextBackWidget extends StatelessWidget {
  const NextBackWidget(
      {super.key,
      required this.isfirst,
      required this.ontapN,
      required this.ontapB});
  final bool isfirst;
  final VoidCallback ontapN;
  final VoidCallback ontapB;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
      child: Row(
        children: [
          GestureDetector(
            onTap: ontapN,
            child: Text(
              S.of(context).next,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: myColor,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onDoubleTap: ontapB,
            child: Text(
              isfirst ? '' : S.of(context).back,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: myColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
