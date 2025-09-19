import 'package:flutter/material.dart';
import 'core/navigator.dart';
import 'core/routes.dart';

void main() {
  print('main: Starting app');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skin Scanner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blue.shade600),
      ),
      navigatorKey: AppNavigator().navigatorKey,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: '/login',
    );
  }
}