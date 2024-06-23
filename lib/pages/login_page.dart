import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:auth_screens/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStateController _authStateController =
      Get.find<AuthStateController>();

  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _passController = TextEditingController(text: "");
  bool logInTapped = false;
  bool _passVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: Get.width * 0.9,
            height: Get.height * 0.4,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
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
                            cursorColor: Colors.blue.shade600,
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
                      bottom: constraints.maxHeight * 0.15,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.9,
                          child: TextField(
                            controller: _passController,
                            obscureText: true,
                            cursorColor: Colors.blue.shade600,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Password",
                              suffixIconConstraints: BoxConstraints.tight(
                                  const Size(56,
                                      48)), //Calculated Value (DO NOT CHANGE)
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _passVisible = !_passVisible;
                                  });
                                },
                                child: Icon(
                                  _passVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey.shade600,
                                ),
                              ),
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
                      top: constraints.maxHeight * 0.45,
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
                              setState(() {
                                logInTapped = true;
                              });
                              await _authStateController.loginWithEmailandPass(
                                  email: _emailController.text,
                                  password: _passController.text);
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  logInTapped = false;
                                });
                              });

                              _emailController.clear();
                              _passController.clear();
                            },
                            child: SizedBox(
                              width: constraints.maxWidth * 0.4,
                              height: constraints.maxHeight * 0.15,
                              child: Center(
                                child: logInTapped
                                    ? SizedBox.square(
                                        dimension: constraints.maxWidth * 0.05,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        "Login",
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
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox.square(
          dimension: Get.width * 0.3,
        ),
        GestureDetector(
          onTap: () {
            Get.offAll(() => const SignupPage());
          },
          child: Text(
            "SignUp",
            style: TextStyle(
              color: Colors.blue.shade600,
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox.square(
          dimension: Get.width * 0.2,
        ),
        Text(
          _authStateController.user != null
              ? (_authStateController.user?.email)!
              : "Not Logged In",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox.square(
          dimension: Get.width * 0.1,
        ),
        Material(
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAlias,
          color: Get.theme.scaffoldBackgroundColor,
          child: InkWell(
            onTap: () async {
              await _authStateController.signOut();
            },
            splashColor: Colors.red.shade100,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                _authStateController.user != null ? "Log Out" : "",
                style: TextStyle(
                  color: Colors.red.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
