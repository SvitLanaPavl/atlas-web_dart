class Password {
  String? _password = '';

  Password({required String password}) : _password = password;

  String? get password => _password;

  set password(String? newPassword) {
    _password = newPassword;
  }

  bool isValid() {
    if (_password.length < 8 || _password.length > 16) {
      return false;
    }
    bool hasUpperCase = _password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = _password.contains(RegExp(r'[a-z]'));
    bool hasNumber = _password.contains(RegExp(r'[0-9]'));
  
    return hasUpperCase && hasLowerCase && hasNumber;
  }
   @override
    String toString() {
      return 'Your Password is: ${_password ?? ''}';
    }
}