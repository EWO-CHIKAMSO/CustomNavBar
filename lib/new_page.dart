import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: const Center(
        child: Text(
          'Wahala dey o!',
          style: TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}