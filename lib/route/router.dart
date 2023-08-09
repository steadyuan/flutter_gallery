import 'package:flutter/material.dart';
import 'package:flutter_gallery/route/layout.dart';
import 'package:flutter_gallery/route/network.dart';
import 'package:flutter_gallery/route/unknown.dart';

/// router
/// @author: steadyuan
/// @date: 2023/8/9
final routes = {
  "/layout": (context, {arguments}) => LayoutScreen(arguments: arguments),
  "/network": (context, {arguments}) => NetworkScreen(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  try {
    final Function routerBuilder = routes[name] as Function;
    if (settings.arguments != null) {
      return MaterialPageRoute(
          builder: (context) =>
              routerBuilder(context, arguments: settings.arguments));
    } else {
      return MaterialPageRoute(builder: (context) => routerBuilder(context));
    }
  } catch (e) {
    return null;
  }
};

var onUnknownRoute = (RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => const UnknownScreen());
};
