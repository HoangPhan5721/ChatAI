import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/chat/presentation/pages/chat_list_page.dart';
import '../features/chat/presentation/pages/chat_conversation_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage(), settings: settings);
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage(), settings: settings);
      // case '/chat-list':
      //   return MaterialPageRoute(builder: (_) => ChatListPage(), settings: settings);
      // case '/chat':
      //   final args = settings.arguments as Map<String, dynamic>?;
      //   final chatId = args?['chatId'] as String? ?? '';
      //   return MaterialPageRoute(
      //     builder: (_) => ChatConversationPage(chatId: chatId),
      //     settings: settings,
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Route not found'))),
          settings: settings,
        );
    }
  }
}