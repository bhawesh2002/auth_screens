import 'package:flutter/material.dart';

class AuthOptionsPage extends StatefulWidget {
  const AuthOptionsPage({super.key});

  @override
  State<AuthOptionsPage> createState() => _AuthOptionsPageState();
}

class _AuthOptionsPageState extends State<AuthOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Center(
      child: Text("Auth Options Page"),
    )));
  }
}
