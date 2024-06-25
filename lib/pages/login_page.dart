import 'package:auth_screens/controllers/auth_state_controller.dart';
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
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _passController = TextEditingController(text: "");
  final FocusNode _passFocusNode = FocusNode();
  final _validationKey = GlobalKey<FormState>();
  bool logInTapped = false;
  final bool _passVisible = true;
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
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.9,
                // height: Get.height * 0.4,
                // margin:
                // EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
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
                    return Form(
                      key: _validationKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.9,
                            child: EmailTextField(
                              emailController: _emailController,
                              emailFocusNode: _emailFocusNode,
                              validator: emailValidator,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.02,
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.9,
                            child: PasswordTextField(
                              passController: _passController,
                              passFocusNode: _passFocusNode,
                              passVisible: _passVisible,
                              validator: passwordValidator,
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
                                _validationKey.currentState?.validate();
                                if (_emailController.text.isNotEmpty) {
                                  if (_passController.text.isNotEmpty) {
                                    await _authStateController
                                        .loginWithEmailandPass(
                                            email: _emailController.text,
                                            password: _passController.text);
                                  } else {
                                    _passFocusNode.requestFocus();
                                  }
                                } else {
                                  _emailFocusNode.requestFocus();
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
                    );
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
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
              SizedBox(
                height: Get.height * 0.1,
              ),
              Text(
                _authStateController.user != null
                    ? (_authStateController.user?.email)!
                    : "Not Logged In",
                style: const TextStyle(
                  fontSize: 16,
                ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
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
            ],
          ),
        ),
      ),
    );
  }
}
