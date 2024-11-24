import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CachedNetworkImageWrapper extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const CachedNetworkImageWrapper(
      {super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return const Skeletonizer(
            effect: PulseEffect(),
            child: SizedBox(
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
