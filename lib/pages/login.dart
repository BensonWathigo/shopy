import 'package:ecommerce/components/myButton.dart';
import 'package:ecommerce/components/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(height: 30),
            Text(
              "Welcome, you've been missed.",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 15),
            MyTextField(
              controller: usernameController,
              hintText: 'username',
              obscureText: true,
            ),
            SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              hintText: 'password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.blue[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            MyButton(
              onTap: () {
                Get.offAllNamed("/homepage");
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Or continue with',
                style: TextStyle(color: Colors.green[400]),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Google.jpg',
                  height: 42,
                ),
                SizedBox(width: 10),
                Image.asset(
                  'images/Apple.jpg',
                  height: 42,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(width: 4),
                Text(
                  'Register now!',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
