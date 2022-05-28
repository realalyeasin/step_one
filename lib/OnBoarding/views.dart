import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/home_page.dart';
import 'controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(126, 106, 182, 1),
      body: Stack(
        children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                            _controller.onBoardingPages[index].imageAsset),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      _controller.onBoardingPages[index].title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: Text(
                        _controller.onBoardingPages[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                );
              }),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: List.generate(
                _controller.onBoardingPages.length,
                (index) => Obx(() {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _controller.selectedPageIndex.value == index
                          ? Colors.yellow
                          : Colors.black,
                      shape: BoxShape.rectangle,
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0,
              onPressed: _controller.forwardAction,
              child: Obx(() {
                return Text(
                  _controller.isLastPage ? 'Start' : 'Next',
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                );
              }),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: FlatButton(
                onPressed: () {
                  Get.to(() => HomePage());
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.yellow),
                ),
              )),
        ],
      ),
    );
  }
}
