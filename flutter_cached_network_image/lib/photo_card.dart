import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_network_image/detail_screen.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) {
        return DetailScreen(imageUrl: imageUrl);
      })),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (_, value) => Container(color: Colors.black12),
          errorWidget: (context, value, error) => Container(
            color: Colors.black12,
            child: const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
