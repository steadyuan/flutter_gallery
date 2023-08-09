import 'package:flutter/material.dart';

/// layout
/// @author: steadyuan
/// @date: 2023/8/9
class LayoutScreen extends StatelessWidget {
  final String arguments;

  const LayoutScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(arguments)),
      body: Center(
        child: ElevatedButton(
          child: const Text("LayoutRoute"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
