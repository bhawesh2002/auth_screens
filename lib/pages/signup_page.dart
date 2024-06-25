import 'package:auth_screens/pages/login_page.dart';
import 'package:auth_screens/utilis/validation.dart';
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
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _passController = TextEditingController(text: "");
  final FocusNode _passFocusNode = FocusNode();
  final TextEditingController _confirmPassController =
      TextEditingController(text: "");
  final FocusNode _confirmPassFocusNode = FocusNode();
  final _validationKey = GlobalKey<FormState>();
  bool signUpTapped = false;
  final bool _passVisible = true;
  final bool _conirfPassVisible = true;
  String? emailValidator(value) {
    if (value!.isEmpty) {
      return "Enter Your Email";
    } else if (validateEmail(value) == false) {
      return "Enter valid Email";
    }
    return null;
  }

  String? confirmPasswordValidator(value) {
    if (value!.isEmpty) {
      return "Confirm Password cannot be empty";
    } else if (value != _passController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "Enter your password";
    }
    return validatePassword(value);
  }

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
              height: Get.height * 0.5,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
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
                    child: Stack(
                      children: [
                        Positioned.fill(
                          bottom: constraints.maxHeight * 0.6,
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: constraints.maxWidth * 0.9,
                              child: EmailTextField(
                                emailController: _emailController,
                                emailFocusNode: _emailFocusNode,
                                validator: emailValidator,
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
                              child: PasswordTextField(
                                passController: _passController,
                                passFocusNode: _passFocusNode,
                                passVisible: _passVisible,
                                validator: passwordValidator,
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
                              child: PasswordTextField(
                                passController: _confirmPassController,
                                passFocusNode: _confirmPassFocusNode,
                                passVisible: _conirfPassVisible,
                                hintText: "Confirm Password",
                                validator: confirmPasswordValidator,
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
                                highlightColor:
                                    const Color.fromARGB(31, 0, 0, 0),
                                onTap: () async {
                                  setState(() {
                                    signUpTapped = true;
                                  });
                                  _validationKey.currentState?.validate();
                                  if (_emailController.text.isNotEmpty) {
                                    if (_passController.text.isNotEmpty) {
                                      if (_confirmPassController
                                              .text.isNotEmpty &&
                                          _passController.text ==
                                              _confirmPassController.text) {
                                        await _authStateController
                                            .signUpWithEmailandPass(
                                                email: _emailController.text,
                                                password: _passController.text);
                                      } else {
                                        _confirmPassFocusNode.requestFocus();
                                      }
                                    } else {
                                      _passFocusNode.requestFocus();
                                    }
                                  } else {
                                    _emailFocusNode.requestFocus();
                                  }
                                  Future.delayed(
                                    const Duration(seconds: 1),
                                    () {
                                      setState(() {
                                        signUpTapped = false;
                                      });
                                    },
                                  );
                                  if (_authStateController.user != null) {
                                    _validationKey.currentState!.reset();
                                  }
                                },
                                child: SizedBox(
                                  width: constraints.maxWidth * 0.4,
                                  height: constraints.maxHeight * 0.12,
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
                          ),
                        ),
                      ],
                    ),
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
              Get.offAll(() => const LoginPage());
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
