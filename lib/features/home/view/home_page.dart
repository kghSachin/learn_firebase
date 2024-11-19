import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase3/core/utils/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const UserInfoContainer(),
              const SizedBox(
                height: 24,
              ),
              NeomorphsSearchBar(controller: TextEditingController()),
              const SizedBox(
                height: 24,
              ),
              CarouselWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: _pageController,
                children: [
                  ...List.generate(5, (index) {
                    return const FractionallySizedBox(
                      widthFactor: 0.95,
                      child: CachedNetworkImageWrapper(
                        imageUrl:
                            "https://thypix.com/wp-content/uploads/2018/05/Sommerlandschaft-Bilder-30.jpg",
                      ),
                    );
                  }),
                ],
              ),
              // Positioned(
              //   bottom: 8,
              //   child: SmoothPageIndicator(
              //     controller: _pageController,
              //     count: 4,
              //     effect: const ExpandingDotsEffect(
              //       dotHeight: 8,
              //       activeDotColor: Colors.orange,
              //       dotColor: Colors.grey,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            activeDotColor: Colors.orange,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class NeomorphsSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;

  const NeomorphsSearchBar({
    super.key,
    required this.controller,
    this.hintText = "Search",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white, // Pure white background
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, // Light shadow
              offset: const Offset(4, 4),
              blurRadius: 8,
            ),
            const BoxShadow(
              color: Colors.white, // Highlight for the neomorphic effect
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: TextFormField(
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              // search
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                color: const Color(0xFF1D1D35).withOpacity(0.64),
              ),
              suffix: InkWell(
                  onTap: () {
                    //unfocus
                    FocusScope.of(context).unfocus();
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  )),
              hintText: "Search",
              hintStyle: TextStyle(
                color: const Color(0xFF1D1D35).withOpacity(0.64),
              ),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0 * 1.5, vertical: 14.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            )));
  }
}

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Sachin",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              "What would you like to learn today?\n Search below",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                )),
          ),
        )
      ],
    );
  }
}
