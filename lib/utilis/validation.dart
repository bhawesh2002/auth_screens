bool validateEmail(String email) {
  final RegExp emailCheck = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  return emailCheck.hasMatch(email);
}

String? validatePassword(String password) {
  // Individual regular expressions for each password requirement
  final RegExp hasUpperCase = RegExp(r'(?=.*[A-Z])');
  final RegExp hasLowerCase = RegExp(r'(?=.*[a-z])');
  final RegExp hasDigit = RegExp(r'(?=.*\d)');
  final RegExp hasSpecialCharacter = RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])');
  final RegExp hasMinLength = RegExp(r'.{8,}');

  // List to hold feedback messages
  List<String> feedback = [];

  // Check each requirement and add feedback if missing
  if (!hasUpperCase.hasMatch(password)) {
    feedback.add('at least one uppercase letter');
  }
  if (!hasLowerCase.hasMatch(password)) {
    feedback.add('at least one lowercase letter');
  }
  if (!hasDigit.hasMatch(password)) {
    feedback.add('at least one digit');
  }
  if (!hasSpecialCharacter.hasMatch(password)) {
    feedback.add('at least one special character');
  }
  if (!hasMinLength.hasMatch(password)) {
    feedback.add('at least 8 characters long');
  }
  if (feedback.isNotEmpty) {
    return feedback.join('\n ');
  } else {
    return null;
  }
}
