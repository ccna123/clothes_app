String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$');
  final isValidEmail = emailRegex.hasMatch(email ?? '');
  if (!isValidEmail) {
    return "Please enter valid email";
  } else {
    return null;
  }
}
