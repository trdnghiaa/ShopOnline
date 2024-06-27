import 'package:flutter/material.dart';
import 'package:shopvippro_demo/views/home_fragment.dart';

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
      body: Center(child: Text('Create New Account')),
    );
  }
}
