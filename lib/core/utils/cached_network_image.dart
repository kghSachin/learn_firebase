import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CachedNetworkImageWrapper extends StatelessWidget {
  final String imageUrl;
  const CachedNetworkImageWrapper({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Skeletonizer(
            effect: const PulseEffect(),
            child: Container(
              height: 200,
              width: double.maxFinite,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.error_outline, color: Colors.grey.shade400),
            ),
          );
        },
      ),
    );
  }
}
