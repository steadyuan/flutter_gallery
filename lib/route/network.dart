import 'package:flutter/material.dart';

import './network/girls_request.dart';

/// network
/// @author: steadyuan
/// @date: 2023/8/9
class NetworkScreen extends StatefulWidget {
  final String arguments;

  const NetworkScreen({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  late Future<GirlsResponse?> futureResponse;

  @override
  void initState() {
    super.initState();
    futureResponse = fetchGirls(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.arguments)),
      body: FutureBuilder<GirlsResponse?>(
        future: futureResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("loading"));
          }
          if (snapshot.hasData) {
            return buildList(snapshot.data?.data.list);
          } else {
            return buildList(null);
          }
        },
      ),
    );
  }

  Widget buildList(List<GirlsBean>? girlsBeanList) {
    return girlsBeanList == null
        ? const Center(child: Text("no data"))
        : GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: girlsBeanList.length,
            itemBuilder: (context, index) {
              return Image.network(girlsBeanList[index].imageUrl);
            },
          );
  }
}
