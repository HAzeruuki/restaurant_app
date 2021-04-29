import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

GetIt locator = GetIt();

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
}

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}