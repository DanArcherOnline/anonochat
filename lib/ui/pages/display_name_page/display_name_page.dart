import 'package:ananochat/ui/core/ui_utils.dart';
import 'package:ananochat/ui/core/widgets/speech_bubble_shape.dart';
import 'package:ananochat/ui/core/widgets/speech_bubble_text_field.dart';
import 'package:ananochat/ui/pages/chat_page/chat_page.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class DisplayNamePage extends StatefulWidget {
  static const id = 'DisplayNamePage';
  @override
  _DisplayNamePageState createState() => _DisplayNamePageState();
}

class _DisplayNamePageState extends State<DisplayNamePage> {
  TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: primaryDarkColor,
        body: Padding(
          padding: EdgeInsets.all(26),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: -120,
                      child: Text(
                        'ANONOCHAT',
                        style: themeData.textTheme.headline1,
                      ),
                    ),
                    Positioned(
                      top: -40,
                      child: Text(
                        'Choose Your Display Name',
                        style: themeData.textTheme.headline2,
                      ),
                    ),
                    SpeechBubleTextField(
                      direction: SpeechBubbleDirection.RIGHT,
                      onFieldSubmitted: (_) => onEnterTapped(context),
                      textEditingController: _controller,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: FlatButton(
                  onPressed: () => onEnterTapped(context),
                  color: lightestColor,
                  child: Text('ENTER'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onEnterTapped(BuildContext context) {
    print('Chosen Display Name: ${_controller.text}');
    if (_controller.text.isNotEmpty) {
      Navigator.popAndPushNamed(
        context,
        ChatPage.id,
        arguments: _controller.text,
      );
    } else {
      Flushbar(
        title: "Hold on!",
        message: "You need a display name to enter the chat room.",
        duration: Duration(seconds: 3),
        backgroundColor: secondaryDarkColor,
      )..show(context);
    }
  }
}
