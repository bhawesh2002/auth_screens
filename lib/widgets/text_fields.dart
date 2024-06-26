import 'package:auth_screens/utilis/validation.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController emailController;
  final FocusNode? emailFocusNode;
  const EmailTextField({
    super.key,
    required this.emailController,
    this.emailFocusNode,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.emailController,
      focusNode: widget.emailFocusNode,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          errorText = null;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          errorText = "Enter Your Email";
        } else if (validateEmail(value) == false) {
          errorText = "Enter valid Email";
        }
        return null;
      },
      autofocus: false,
      cursorColor: Colors.blue.shade600,
      decoration: InputDecoration(
        errorText: errorText,
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
  final FocusNode? passFocusNode;
  final String? hintText;
  final bool forLogin;
  final TextEditingController? confirmationController;
  final String? Function(String?)? confirmPassValidator;

  const PasswordTextField({
    super.key,
    required this.passController,
    this.passFocusNode,
    this.hintText = "Password",
    this.confirmPassValidator,
    this.confirmationController,
    this.forLogin = false,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passVisible = true;
  String? helperText;
  String? errorText;
  void passValidator(value) {
    if (value!.isEmpty) {
      errorText = "Enter Your Password";
    } else {
      errorText = validatePassword(value);
    }
  }

  void confirmPassValidator(value) {
    if (value!.isEmpty) {
      errorText = "Confirm Password cannot be empty";
    } else if (value != widget.confirmationController!.text) {
      errorText = "Passwords do not match";
    } else if (value == widget.confirmationController!.text) {
      errorText = null;
    }
  }

  void passHelper(value) {
    String? feedback = validatePassword(value);
    errorText = null;
    if (value.isNotEmpty) {
      setState(() {
        helperText = feedback;
      });
    } else {
      setState(() {
        helperText = "Enter Your Password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      controller: widget.passController,
      focusNode: widget.passFocusNode,
      autofocus: false,
      obscureText: passVisible,
      onChanged: widget.forLogin == false
          ? (value) {
              widget.confirmationController == null
                  ? passHelper(value)
                  : errorText = null;
            }
          : (value) {
              setState(() {
                errorText = null;
                helperText = null;
              });
            },
      validator: widget.forLogin == false
          ? (value) {
              widget.confirmationController == null
                  ? passValidator(value)
                  : confirmPassValidator(value);
              return null;
            }
          : (value) {
              if (value!.isEmpty) {
                errorText = "Password cannot be empty";
              } else {
                errorText = null;
              }
              return null;
            },
      cursorColor: Colors.blue.shade600,
      decoration: InputDecoration(
        helperText: helperText,
        errorText: errorText,
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        suffixIconConstraints: BoxConstraints.tight(
            const Size(56, 48)), //Calculated Value (DO NOT CHANGE)
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              passVisible = !passVisible;
            });
          },
          child: Icon(
            passVisible ? Icons.visibility_off : Icons.visibility,
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
