import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Wathigo';
  String phone = '0723552044';
  String address = 'P.O.Box 10143 -00400';
  String email = 'bensonwathigo21@gmail.com';

  void resetFields() {
    setState(() {
      userName = '';
      phone = '';
      address = '';
      email = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/Blue.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            itemProfile('username', userName, CupertinoIcons.person),
            const SizedBox(
              height: 20,
            ),
            itemProfile('Phone', email, CupertinoIcons.phone),
            const SizedBox(
              height: 20,
            ),
            itemProfile('Address', address, CupertinoIcons.location),
            const SizedBox(
              height: 20,
            ),
            itemProfile('email', email, CupertinoIcons.mail),
            SizedBox(
              child: ElevatedButton(
                onPressed: resetFields,
                child: const Text('Reset Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget itemProfile(String title, String subtitle, IconData icondata) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.green[600],
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icondata),
    ),
  );
}
