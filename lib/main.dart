import 'package:ananochat/services/chat_service.dart';
import 'package:ananochat/ui/app_theme.dart';
import 'package:ananochat/ui/pages/chat_page/chat_page.dart';
import 'package:ananochat/ui/pages/display_name_page/display_name_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ChatService(),
      child: AnonochatApp(),
    ),
  );
}

class AnonochatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData,
      initialRoute: DisplayNamePage.id,
      routes: {
        DisplayNamePage.id: (context) => DisplayNamePage(),
        ChatPage.id: (context) => ChatPage(),
      },
    );
  }
}
