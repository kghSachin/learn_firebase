import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase3/core/utils/cached_network_image.dart';
import 'package:learn_firebase3/features/home/view/widgets/test_tile.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const UserInfoContainer(),
                const SizedBox(
                  height: 24,
                ),
                Row(children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: const Row(children: [
                      Icon(
                        Icons.widgets_rounded,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Learn & Explore ",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: const Row(children: [
                        Icon(
                          Icons.book,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Explore Courses ",
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 24,
                ),
                const CarouselWidget(),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      "My Courses",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    const Icon(Icons.menu),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: index == 0
                                    ? Colors.blueGrey
                                    : Colors.grey)),
                        child: Center(
                          child: Text(
                            "Class $index",
                            style: TextStyle(
                              color: index == 0 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TestTile(),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
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
    return SizedBox(
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
          Positioned(
            bottom: 8,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 10,
                activeDotColor: Colors.orange,
                dotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
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
