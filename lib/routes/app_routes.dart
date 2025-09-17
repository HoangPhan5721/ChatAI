import 'package:flutter/material.dart';

class AppRoutes {
  static const String chatListScreen = '/chat_list_screen';
  static const String chatConversationScreen = '/chat_conversation_screen';
  static const String chatConversationScreenInitialPage =
      '/chat_conversation_screen_initial_page';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
    initialRoute: chatListScreen.builder;
  };
}
