import 'package:flutter/material.dart';
import 'package:mad_labs/Model.dart';
import 'package:mad_labs/db_helper.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _registerUser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    User user = User(username: username, password: password);
    await _databaseHelper.insertUser(user);

    // You can add navigation or other logic after registration here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
