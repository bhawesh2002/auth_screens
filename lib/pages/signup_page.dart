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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: Get.width * 0.9,
            height: Get.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(Get.width * 0.025),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, Get.height * 0.010),
                  color: Colors.grey.shade300,
                  blurRadius: 30,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned.fill(
                      bottom: constraints.maxHeight * 0.6,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.9,
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Email",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.shade600,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: constraints.maxHeight * 0.2,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.9,
                          child: TextField(
                            controller: _passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Password",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.shade600,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: constraints.maxHeight * 0.2,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.9,
                          child: TextField(
                            controller: _confirmPassController,
                            cursorColor: Colors.blue.shade600,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Confirm Password",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.shade600,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: constraints.maxHeight * 0.6,
                      child: Align(
                          alignment: Alignment.center,
                          child: Material(
                            borderRadius: BorderRadius.circular(
                              constraints.maxWidth * 0.02,
                            ),
                            color: Colors.blue.shade600,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              splashColor: const Color.fromARGB(31, 0, 0, 0),
                              highlightColor: const Color.fromARGB(31, 0, 0, 0),
                              onTap: () async {
                                await _authStateController
                                    .signUpWithEmailandPass(
                                        email: _emailController.text,
                                        password: _passController.text);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.12,
                                    vertical: constraints.maxHeight * 0.03),
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
