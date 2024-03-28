class JValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Yêu cầu điền email.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Email không hợp lệ.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Yêu cầu điền mật khẩu.';
    }

    // Check for minimum password length
    if (value.length < 8) {
      return 'Mật khẩu phải có ít nhất 8 kí tự.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Mật khẩu phải chứa ít nhất 1 kí tự in hoa.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Mật khẩu phải chứa ít nhất 1 chữ số.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Mật khẩu phải chứa ít nhật một kí tự đặc biệt.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
