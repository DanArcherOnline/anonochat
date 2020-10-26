import 'package:flutter/material.dart';

enum SpeechBubbleDirection {
  LEFT,
  RIGHT,
}

class SpeechBubbleShape extends StatelessWidget {
  final double borderRadiusValue = 30.0;

  final SpeechBubbleDirection direction;
  final Color color;
  final Widget child;

  const SpeechBubbleShape({
    Key key,
    @required this.direction,
    @required this.color,
    @required this.child,
  }) : super(key: key);

  double getTopRightBorderRaiusValue() =>
      direction == SpeechBubbleDirection.LEFT ? borderRadiusValue : 0.0;
  double getTopLeftBorderRaiusValue() =>
      direction == SpeechBubbleDirection.RIGHT ? borderRadiusValue : 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadiusValue),
          bottomRight: Radius.circular(borderRadiusValue),
          topLeft: Radius.circular(getTopLeftBorderRaiusValue()),
          topRight: Radius.circular(getTopRightBorderRaiusValue()),
        ),
      ),
      child: child,
    );
  }
}
