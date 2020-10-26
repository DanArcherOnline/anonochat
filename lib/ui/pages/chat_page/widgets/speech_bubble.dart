import 'package:ananochat/ui/core/widgets/speech_bubble_shape.dart';
import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  final String message;
  final String displayName;
  final Color color;
  final SpeechBubbleDirection direction;

  const SpeechBubble({
    Key key,
    @required this.message,
    this.displayName,
    @required this.direction,
    this.color = Colors.blueGrey,
  }) : super(key: key);

  getCrossAxisAlignment() => direction == SpeechBubbleDirection.LEFT
      ? CrossAxisAlignment.start
      : CrossAxisAlignment.end;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: getCrossAxisAlignment(),
      children: [
        if (displayName != null) ...[
          Text(
            displayName,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 4),
        ],
        SpeechBubbleShape(
          direction: direction,
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 23,
              vertical: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
