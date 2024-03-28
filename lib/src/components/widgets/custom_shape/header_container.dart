import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/widgets/custom_shape/circular_container.dart';
import 'package:job_app/src/components/widgets/custom_shape/curved_widget.dart';

class JHeaderContainer extends StatelessWidget {
  const JHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return JCurveWidget(
      child: Container(
        padding: const EdgeInsets.only(bottom: 0),
        color: JColors.primary,
        child: Stack(children: [
          Positioned(
            top: -150,
            right: -250,
            child: JCircularContainer(
                backgroundColor: JColors.white.withOpacity(0.1)),
          ),
          Positioned(
            top: 100,
            right: -300,
            child: JCircularContainer(
                backgroundColor: JColors.white.withOpacity(0.1)),
          ),
          child,
        ]),
      ),
    );
  }
}
