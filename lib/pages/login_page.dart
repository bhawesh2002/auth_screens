import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:auth_screens/pages/auth_option_grid.dart';
import 'package:auth_screens/pages/signup_page.dart';
import 'package:auth_screens/utilis/validation.dart';
import 'package:auth_screens/widgets/text_fields.dart';
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
  final _validationKey = GlobalKey<FormState>();
  bool logInTapped = false;
  String? emailValidator(value) {
    if (value!.isEmpty) {
      return "Enter Your Email";
    } else if (validateEmail(value) == false) {
      return "Enter valid Email";
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "Password is Empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
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
                        child: const Text("Go Home"),
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
                  "Welcome Back!",
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
                  "Login to vanilla auth screens",
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
                            forLogin: true,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.01,
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  if (validateEmail(_emailController.text)) {
                                    await _authStateController
                                        .sendPassResetEmail(
                                      email: _emailController.text,
                                    );
                                    Get.snackbar("Email Sent",
                                        "Password reset email sent successfully");
                                  } else {
                                    Get.snackbar("Email is Empty",
                                        "Enter valid email to reset your password");
                                  }
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                              ),
                            ),
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
                                  logInTapped = true;
                                });

                                if (_validationKey.currentState!.validate()) {
                                  await _authStateController
                                      .loginWithEmailandPass(
                                          email: _emailController.text,
                                          password: _passController.text);
                                }
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    logInTapped = false;
                                  });
                                });
                                if (_authStateController.user != null) {
                                  _validationKey.currentState!.reset();
                                }
                              },
                              child: SizedBox(
                                width: Get.width * 0.35,
                                height: Get.height * 0.065,
                                child: Center(
                                  child: logInTapped
                                      ? SizedBox.square(
                                          dimension:
                                              constraints.maxWidth * 0.05,
                                          child:
                                              const CircularProgressIndicator(
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
              child: SizedBox(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Padding(
                        //     padding: EdgeInsets.only(
                        //   bottom: constraints.maxHeight * 0.3,
                        // )),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => const SignupPage());
                          },
                          child: Column(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Signup",
                                style: TextStyle(
                                  color: Colors.blue.shade600,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => _authStateController.user != null
                              ? Column(
                                  children: [
                                    Text(
                                      (_authStateController.user?.email)!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          clipBehavior: Clip.antiAlias,
                                          color:
                                              Get.theme.scaffoldBackgroundColor,
                                          child: InkWell(
                                            onTap: () async {
                                              await _authStateController
                                                  .signOut();
                                            },
                                            splashColor: Colors.red.shade100,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Log Out",
                                                    style: TextStyle(
                                                      color:
                                                          Colors.red.shade500,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                constraints.maxWidth * 0.02,
                                          ),
                                        ),
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          clipBehavior: Clip.antiAlias,
                                          color:
                                              Get.theme.scaffoldBackgroundColor,
                                          child: InkWell(
                                            onTap: () async {
                                              await _authStateController
                                                  .deleteAc();
                                            },
                                            splashColor: Colors.red.shade100,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Delete Account",
                                                    style: TextStyle(
                                                      color:
                                                          Colors.red.shade500,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox(),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            // height: Get.height * 0.1,
            // ),
          ],
        ),
      ),
    );
  }
}
