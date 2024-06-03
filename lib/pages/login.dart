import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned.fill(
                    top: height * 0.125,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              );
            })),
      ),
    );
  }
}
