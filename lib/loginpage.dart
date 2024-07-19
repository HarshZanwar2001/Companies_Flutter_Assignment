import 'package:assignmentloginandsignup/homepage.dart';
import 'package:assignmentloginandsignup/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _termsAccepted = false;

  Future<void> _checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    if (_emailController.text == storedEmail &&
        _passwordController.text == storedPassword &&
        _termsAccepted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    } else {
      String errorMessage = 'Invalid email or password.';
      if (!_termsAccepted) {
        errorMessage = 'Please accept the terms and conditions';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Bold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: constraints.maxWidth * 0.8,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: constraints.maxWidth * 0.8,
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: constraints.maxWidth * 0.8,
                      child: Row(
                        children: [
                          Checkbox(
                            value: _termsAccepted,
                            onChanged: (value) {
                              setState(() {
                                _termsAccepted = value ?? false;
                              });
                            },
                          ),
                          Flexible(child: Text("Terms and Condition")),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: constraints.maxWidth * 0.8,
                      child: ElevatedButton(
                        onPressed: _checkLogin,
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(height: 20), // Add some space between the buttons
                    Container(
                      width: constraints.maxWidth * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                        child: Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
