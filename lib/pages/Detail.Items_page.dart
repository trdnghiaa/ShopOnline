import 'package:flutter/material.dart';

class DetailItemsPage extends StatefulWidget {
  const DetailItemsPage({super.key});

  @override
  State<DetailItemsPage> createState() => _DetailItemsPageState();
}

class _DetailItemsPageState extends State<DetailItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}