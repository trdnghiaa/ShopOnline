import 'package:flutter/material.dart';
import 'profile_page.dart';

class NewAccCount extends StatefulWidget {
  const NewAccCount({super.key});

  @override
  State<NewAccCount> createState() => _NewAccCountState();
}

class _NewAccCountState extends State<NewAccCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Account'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
