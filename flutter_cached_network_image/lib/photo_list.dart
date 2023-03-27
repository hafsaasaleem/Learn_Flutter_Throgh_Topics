import 'package:flutter/material.dart';
import 'package:flutter_cached_network_image/photo_card.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 20,
      itemBuilder: (_, index) {
        final imageUrl =
            "https://source.unsplash.com/random/?sig=$index/900×700/?nature";
        return Hero(
          tag: imageUrl,
          child: PhotoCard(imageUrl: imageUrl),
        );
      },
      separatorBuilder: (_, index) => const SizedBox(height: 16),
    );
  }
}
