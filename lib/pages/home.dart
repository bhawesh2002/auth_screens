import 'package:auth_screens/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Auth Screen Example",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 50,
              indent: 50,
              endIndent: 50,
              thickness: 2,
              color: Colors.grey.shade300,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.signup);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
              ),
              child: Text(
                "Signup Page",
                style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
              ),
            ),
            const SizedBox.square(
              dimension: 4,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.login);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
              ),
              child: Text(
                "Login Page",
                style: TextStyle(color: Colors.grey.shade900, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
