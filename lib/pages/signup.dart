import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.015,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned.fill(
                    top: height * 0.1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * 0.45,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              hintText: "Enter your name"),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * 0.26,
                    child: const Align(
                      alignment: Alignment.center,
                      child: AuthTextField(authFieldType: AuthFieldType.email),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * 0.075,
                    child: const Align(
                      alignment: Alignment.center,
                      child:
                          AuthTextField(authFieldType: AuthFieldType.password),
                    ),
                  ),
                  Positioned.fill(
                    top: height * 0.185,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: constraints.maxWidth * 0.9,
                        height: constraints.maxHeight * 0.065,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.pink.shade400,
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.grey.shade100,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * 0.265,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Or Log In With",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * 0.225,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Divider(
                        indent: width * 0.1,
                        endIndent: width * 0.1,
                        thickness: 2.5,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: height * 0.135,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.apple,
                                color: Colors.black,
                                size: width * 0.1,
                              ),
                              Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: width * 0.1,
                              ),
                              Icon(
                                Icons.g_mobiledata_rounded,
                                color: Colors.red,
                                size: width * 0.1,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Positioned.fill(
                    bottom: height * 0.05,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account?  ",
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                          children: [
                            TextSpan(
                              text: "Log In?",
                              style: TextStyle(
                                color: Colors.pink.shade400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
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
    );
  }
}

enum AuthFieldType { email, password }

class AuthTextField extends StatefulWidget {
  final AuthFieldType authFieldType;
  const AuthTextField({super.key, required, required this.authFieldType});

  @override
  State<StatefulWidget> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext conetxt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        keyboardType: widget.authFieldType == AuthFieldType.email
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        controller: widget.authFieldType == AuthFieldType.email
            ? emailController
            : passController,
        obscureText:
            widget.authFieldType == AuthFieldType.password ? true : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
          ),
          hintText: widget.authFieldType == AuthFieldType.email
              ? "Enter your email"
              : "Enter your password",
        ),
      ),
    );
  }
}
