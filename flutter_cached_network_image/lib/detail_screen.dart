// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_cached_network_image/photo_card.dart';

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  const DetailScreen({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Hero(
            tag: imageUrl,
            child: PhotoCard(imageUrl: imageUrl)),
          const SizedBox(height: 16),
          Text("Photo Gallery", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 12),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ],
      ),
    );
  }
}
