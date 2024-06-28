import 'package:auth_screens/pages/auth_option_grid.dart';
import 'package:auth_screens/pages/login_page.dart';
import 'package:auth_screens/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthStateController _authStateController =
      Get.find<AuthStateController>();

  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _passController = TextEditingController(text: "");
  final TextEditingController _confirmPassController =
      TextEditingController(text: "");
  final _validationKey = GlobalKey<FormState>();
  bool signUpTapped = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: PopupMenuButton(
                  iconSize: 24,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          Get.offAll(() => const AuthOptionsPage());
                        },
                        child: const Text("Collections"),
                      ),
                    ];
                  },
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Signup with vanilla auth screens",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24,
              ),
            ),
            Container(
              width: Get.width * 0.9,
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(Get.width * 0.025),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(Get.height * 0.005, Get.height * 0.010),
                    color: const Color.fromARGB(255, 201, 233, 255),
                    blurRadius: 35,
                  ),
                ],
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Form(
                    key: _validationKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          EmailTextField(
                            emailController: _emailController,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.02,
                            ),
                          ),
                          PasswordTextField(
                            passController: _passController,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.02,
                            ),
                          ),
                          PasswordTextField(
                            passController: _confirmPassController,
                            hintText: "Confirm Password",
                            confirmationController: _passController,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: Get.height * 0.06,
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxWidth * 0.02,
                            ),
                            color: Colors.blue.shade600,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              splashColor: const Color.fromARGB(31, 0, 0, 0),
                              highlightColor: const Color.fromARGB(31, 0, 0, 0),
                              onTap: () async {
                                setState(() {
                                  signUpTapped = true;
                                });
                                if (_validationKey.currentState!.validate()) {
                                  await _authStateController
                                      .signUpWithEmailandPass(
                                          email: _emailController.text,
                                          password: _passController.text);
                                }
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    setState(() {
                                      signUpTapped = false;
                                      _authStateController.updateUserState();
                                    });
                                  },
                                );
                              },
                              child: SizedBox(
                                width: Get.width * 0.35,
                                height: Get.height * 0.065,
                                child: Center(
                                  child: signUpTapped
                                      ? SizedBox.square(
                                          dimension:
                                              constraints.maxWidth * 0.05,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          "Signup",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: Get.height * 0.1,
            // ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.offAll(() => const LoginPage());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
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
