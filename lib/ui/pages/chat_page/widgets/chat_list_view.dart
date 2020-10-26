import 'package:ananochat/domain/message.dart';
import 'package:ananochat/services/chat_service.dart';
import 'package:ananochat/ui/core/widgets/speech_bubble_shape.dart';
import 'package:ananochat/ui/pages/chat_page/widgets/speech_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_theme.dart';

class ChatListView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final displayName;
  ChatListView({
    Key key,
    @required this.displayName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: StreamBuilder<List<Message>>(
        stream: Provider.of<ChatService>(context).messages,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 26),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildFirstSpeechBubble(
                    context: context,
                    index: index,
                    snapshot: snapshot,
                  );
                }
                if (index == snapshot.data.length - 1) {
                  return buildLastSpeechBubble(
                    context: context,
                    index: index,
                    snapshot: snapshot,
                  );
                }
                return buildSpeechBubble(
                  context: context,
                  index: index,
                  snapshot: snapshot,
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 20),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: secondaryDarkColor,
                valueColor: AlwaysStoppedAnimation<Color>(primaryLightColor),
              ),
            );
          }
        },
      ),
    );
  }

  void scrollToBottomOfChat() => _scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

  Widget buildSpeechBubble({
    @required BuildContext context,
    @required int index,
    @required AsyncSnapshot snapshot,
  }) {
    final Message message = snapshot.data[index];
    final bool isCurrentUser = message.displayName == displayName;
    String displayNameString;
    SpeechBubbleDirection direction;
    Color color;
    if (isCurrentUser) {
      direction = SpeechBubbleDirection.RIGHT;
      color = primaryLightColor;
    } else {
      displayNameString = message.displayName;
      direction = SpeechBubbleDirection.LEFT;
      color = secondaryDarkColor;
    }

    return SpeechBubble(
      message: message.content,
      displayName: displayNameString,
      direction: direction,
      color: color,
    );
  }

  Widget buildFirstSpeechBubble({
    @required BuildContext context,
    @required int index,
    @required AsyncSnapshot snapshot,
  }) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: buildSpeechBubble(
            context: context,
            index: index,
            snapshot: snapshot,
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget buildLastSpeechBubble({
    @required BuildContext context,
    @required int index,
    @required AsyncSnapshot snapshot,
  }) {
    return Column(
      children: [
        SizedBox(height: 40),
        Container(
          width: double.infinity,
          child: buildSpeechBubble(
            context: context,
            index: index,
            snapshot: snapshot,
          ),
        ),
      ],
    );
  }
}
