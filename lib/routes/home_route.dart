import 'package:flutter/material.dart';
import 'package:helloworld/screens/cni_screen.dart';
import 'package:helloworld/screens/sp_screen.dart';

class HomeRoutes {
  static const String test = '/';
  static const String webview = 'webview';
  static const String animate = 'animate';
  static const String sharepreferences = 'sharepreferences';
  static const String imagecatching = 'imagecatching';
  static Map<String, WidgetBuilder> get routes {
    return {
      sharepreferences: (context) => const SharePreferencesScreen(),
      imagecatching: (context) => const CachedNetworkImageScreen(),
    };
  }
}
