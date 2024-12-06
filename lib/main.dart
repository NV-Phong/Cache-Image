import 'package:flutter/material.dart';
import 'routes/home_route.dart';

Future<void> main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelloWorld',
      initialRoute: HomeRoutes.imagecatching,
      routes: HomeRoutes.routes,
    );
  }
}
