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
