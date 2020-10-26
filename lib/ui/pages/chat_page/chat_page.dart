import 'package:ananochat/domain/message.dart';
import 'package:ananochat/services/chat_service.dart';
import 'package:ananochat/ui/core/ui_utils.dart';
import 'package:ananochat/ui/core/widgets/display_name_bar.dart';
import 'package:ananochat/ui/pages/chat_page/widgets/chat_input_bar.dart';
import 'package:ananochat/ui/pages/chat_page/widgets/chat_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';

class ChatPage extends StatefulWidget {
  static const id = 'ChatPage';

  const ChatPage({
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingcController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String displayName = ModalRoute.of(context).settings.arguments;
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: primaryDarkColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DisplayNameBar(displayName: displayName),
              ChatListView(displayName: displayName),
              SizedBox(height: 4),
              ChatInputBar(
                textEditingController: _textEditingcController,
                onSend: () => sendMessage(displayName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendMessage(String displayName) {
    Provider.of<ChatService>(context, listen: false).addMessage(
      Message(
        _textEditingcController.text,
        displayName,
      ),
    );
    _textEditingcController.clear();
  }

  void scrollToBottomOfChat() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
