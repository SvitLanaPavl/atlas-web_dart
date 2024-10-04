import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    String userData = await fetchUserData();

    Map<String, dynamic> userMap = jsonDecode(userData);
    String username = userMap['username'];

    return 'Hello $username';
  } catch (error) {
    return 'error caught: $error';
  }
}

Future<String> loginUser() async {
  try {
    bool credentialsValid = await checkCredentials();

    if (credentialsValid) {
      print('There is a user: true');
      return await greetUser();
    } else {
      print('There is a user: false');
      return 'Wrong credentials';
    }
  } catch (error) {
    return 'error caught: $error';
  }
}
