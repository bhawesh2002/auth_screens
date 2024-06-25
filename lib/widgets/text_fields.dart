import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final String? Function(String?)? validator;
  const EmailTextField({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      focusNode: emailFocusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      validator: validator,
      autofocus: false,
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
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  final TextEditingController passController;
  final FocusNode passFocusNode;
  bool passVisible;
  final String? hintText;
  final String? Function(String?)? validator;

  PasswordTextField({
    super.key,
    required this.passController,
    required this.passFocusNode,
    required this.passVisible,
    this.hintText = "Password",
    required this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.passController,
      focusNode: widget.passFocusNode,
      autofocus: false,
      obscureText: widget.passVisible,
      onChanged: (value) {},
      validator: widget.validator,
      cursorColor: Colors.blue.shade600,
      decoration: InputDecoration(
        errorMaxLines: 8,
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        suffixIconConstraints: BoxConstraints.tight(
            const Size(56, 48)), //Calculated Value (DO NOT CHANGE)
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              widget.passVisible = !widget.passVisible;
            });
          },
          child: Icon(
            widget.passVisible ? Icons.visibility_off : Icons.visibility,
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
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
      ),
    );
  }
}
