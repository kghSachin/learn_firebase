import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase3/core/utils/cached_network_image.dart';
import 'package:learn_firebase3/features/home/view/test_page.dart';

class TestTile extends ConsumerWidget {
  const TestTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TestPage(),
          ),
        );
      },
      leading: const CachedNetworkImageWrapper(
        imageUrl:
            "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
        height: 150,
        width: 80,
      ),
      title: const Text("Mock Test Series "),
      subtitle: RichText(
          text: TextSpan(children: [
        TextSpan(text: "Quiz", style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(text: "  |  ", style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(
            text: "10 questions",
            style: Theme.of(context).textTheme.bodyMedium),
      ])),
      trailing: const Icon(Icons.arrow_forward_ios),
      splashColor: Colors.blueGrey.shade100,
    );
  }
}
