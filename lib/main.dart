import 'package:flutter/material.dart';
import 'package:scube_task_app/sub_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'detail_page.dart';

void main() {
  runApp(const ScubeTaskApp());
}

class ScubeTaskApp extends StatelessWidget {
  const ScubeTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scube Task App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/sub': (context) => const SubPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
