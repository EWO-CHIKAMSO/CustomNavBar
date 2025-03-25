import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade500,
      body: Center(
        child: Text(
          "This is the new page!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}




