import 'dart:async';

import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

late PageController _pageController;
late Timer _timer;
int _currentPage = 0;
var listOfImages = [
  Image.asset('assets/buddies/buddy1.png'),
  Image.asset('assets/buddies/buddy2.png'),
  Image.asset('assets/buddies/buddy3.png'),
  Image.asset('assets/buddies/buddy4.png'),
  Image.asset('assets/buddies/buddy5.png'),
  Image.asset('assets/buddies/buddy6.png'),
];

class _ImageSliderState extends State<ImageSlider> {
  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.6
    );
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        if (_currentPage == 5) {
          _currentPage = -1;
        }
        _pageController.nextPage(
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.easeOut,
        );
        _currentPage++;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _currentPage = 0;
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.dependOnInheritedWidgetOfExactType();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: PageView.builder(
          itemBuilder: (context, index) {
            if(index >= 5) {
              return listOfImages[_currentPage];
            }
            return listOfImages[index];
          },
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          allowImplicitScrolling: true,
        ),
      ),
    );
  }
}
