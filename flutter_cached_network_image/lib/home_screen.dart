import 'package:flutter/material.dart';
import 'package:flutter_cached_network_image/photo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cached Network Image")),
      body: const PhotoList(),
    );
  }
}
