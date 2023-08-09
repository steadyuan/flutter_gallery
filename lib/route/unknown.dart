import 'package:flutter/material.dart';

/// unknown
/// @author: steadyuan
/// @date: 2023/8/9
class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Unknown")),
      body: const Center(
        child: Text("Not ready yet, stay tuned!"),
      ),
    );
  }
}
