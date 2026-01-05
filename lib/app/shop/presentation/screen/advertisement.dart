import 'dart:async';
import 'package:flutter/material.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({super.key});

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<String> addImage = const [
    'asset/img/Card.png',
    'asset/img/Card.png',
    'asset/img/Card.png',
    'asset/img/Card.png',
  ];

  Timer? timer;
  @override
  void initState() {
    super.initState();

    currentPage = 1000;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(currentPage);

      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        currentPage++;

        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          final realIndex = index % addImage.length;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _AddCard(imagePath: addImage[realIndex]),
          );
        },
      ),
    );
  }
}

class _AddCard extends StatelessWidget {
  const _AddCard({required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
    );
  }
}
