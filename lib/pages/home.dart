import 'package:auth_screens/pages/login.dart';
import 'package:auth_screens/pages/signup.dart';
import 'package:flutter/material.dart';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LogIn(),
                  ),
                );
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
