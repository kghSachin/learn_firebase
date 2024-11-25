import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase3/core/utils/cached_network_image.dart';
import 'package:learn_firebase3/features/home/view/test_page.dart';

class TestTile extends ConsumerWidget {
  const TestTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          splashColor: Colors.blueGrey.shade100,
          radius: 16,
          onTap: () {
            print("clicked");
          },
          child: Row(
            children: [
              // Leading Image with Rounded Corners
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImageWrapper(
                  imageUrl:
                      "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
                  height: 80,
                  width: 80,
                ),
              ),
              const SizedBox(width: 16), // Space between image and text
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Science Class 10",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                            ),
                        children: [
                          TextSpan(
                            text: "Quiz",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          TextSpan(
                            text: "  |  ",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          TextSpan(
                            text: "10 questions",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8), // Space between text and trailing icon
              // Trailing Icon
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
