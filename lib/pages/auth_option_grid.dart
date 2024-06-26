import 'package:auth_screens/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOptionsPage extends StatefulWidget {
  const AuthOptionsPage({super.key});

  @override
  State<AuthOptionsPage> createState() => _AuthOptionsPageState();
}

class _AuthOptionsPageState extends State<AuthOptionsPage> {
  SliverGridDelegate myDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
  int items = 5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.1,
                  horizontal: Get.width * 0.05,
                ),
                child: Text(
                  "Auth Screens",
                  style: TextStyle(
                    fontSize: 8 * 4,
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                width: Get.width,
                // height: Get.height * 0.2,
                child: GridView(
                  gridDelegate: myDelegate,
                  padding: const EdgeInsets.all(16),
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.blue.shade600,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const SignupPage());
                          },
                          child: const Center(
                              child: Text(
                            "Vanilla Screens",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
