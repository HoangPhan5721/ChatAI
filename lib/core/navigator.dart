import 'package:flutter/material.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  void goBackUntil(String name) {
    return navigatorKey.currentState!.popUntil((route) {
      return route.settings.name == name;
    });
  }

  Future<void> pushReplace(StatelessWidget screen) async {
    navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  Future<void> replaceAll(StatelessWidget screen) async {
    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
          (route) => false,
    );
  }

  Future<void> navigatorToWithStateless(StatelessWidget screen) async {
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => screen));
  }

  Future<void> navigatorToWithStatelessWithSetting(StatelessWidget screen, String name) async {
    navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => screen, settings: RouteSettings(name: name)),
    );
  }

  Future<void> pushReplacement(StatelessWidget screen) async {
    navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  Future<void> navigatorToWithStatelessHaveReload(StatelessWidget screen, VoidCallback onRefresh) async {
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => screen)).then((value) {
      onRefresh();
    });
  }

  Future<void> navigatorToWithStatelessHaveReloadParams(StatelessWidget screen, Function(dynamic params) onRefresh) async {
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => screen)).then((value) {
      onRefresh(value);
    });
  }

  Future<void> navigatorToWithStatelessHaveReloadMaps(
      StatelessWidget screen, Function(List<Map<String, dynamic>> maps) onRefresh) async {
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => screen)).then((value) {
      onRefresh(value);
    });
  }

  String? getCurrentRoute() {
    return navigatorKey.currentContext != null
        ? ModalRoute.of(navigatorKey.currentContext!)?.settings.name
        : null;
  }

  Future<void> pushReplaceRouter(String routeName) async {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  bool isCurrentRoute(String routeName) {
    return getCurrentRoute() == routeName;
  }

  BuildContext getCurrentContext() {
    return navigatorKey.currentContext!;
  }
}