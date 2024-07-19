import 'package:assignmentloginandsignup/homepage.dart';
import 'package:assignmentloginandsignup/loginpage.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Loginpage()),
              (Route<dynamic> route) => false,
            );
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
