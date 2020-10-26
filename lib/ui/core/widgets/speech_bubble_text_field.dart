import 'package:ananochat/ui/core/widgets/speech_bubble_shape.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class SpeechBubleTextField extends StatelessWidget {
  final SpeechBubbleDirection direction;
  final TextEditingController textEditingController;
  final Function(String) onFieldSubmitted;

  const SpeechBubleTextField({
    Key key,
    @required this.textEditingController,
    @required this.onFieldSubmitted,
    @required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeechBubbleShape(
      direction: direction,
      color: primaryLightColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: TextFormField(
          controller: textEditingController,
          keyboardAppearance: Brightness.dark,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: lightestColor,
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ),
    );
  }
}
