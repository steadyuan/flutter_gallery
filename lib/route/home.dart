import 'package:flutter/material.dart';
import 'package:flutter_gallery/remote/data_repository.dart';

/// home
/// @author: steadyuan
/// @date: 2023/8/8
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = DataRepository.provideItems();
  }

  @override
  void dispose() {
    super.dispose();
    data.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, data[index]["route"],
                  arguments: data[index]["title"]);
            },
            child: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text(data[index]["title"]),
            ),
          );
        },
      ),
    );
  }
}
