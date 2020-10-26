import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class ChatInputBar extends StatelessWidget {
  final Function onSend;
  const ChatInputBar({
    Key key,
    @required TextEditingController textEditingController,
    @required this.onSend,
  })  : _textEditingcontroller = textEditingController,
        super(key: key);

  final TextEditingController _textEditingcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
        left: 8,
        right: 8,
      ),
      height: 52,
      decoration: BoxDecoration(
        color: lightestColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 7,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: TextFormField(
                controller: _textEditingcontroller,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(hintText: 'Enter Message'),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: primaryDarkColor,
                ),
                child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.only(left: 4),
                  color: lightestColor,
                  icon: Icon(
                    Icons.send,
                  ),
                  splashRadius: 60,
                  onPressed: onSend,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
