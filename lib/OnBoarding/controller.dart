import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Screens/home_page.dart';
import 'model.dart';

class OnBoardingController extends GetxController{
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length-1;
  var pageController = PageController();

  forwardAction(){
    if(isLastPage){
      Get.to(()=>HomePage());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeInOut);
    }
  }

  List<OnBoardingThings> onBoardingPages = [
    OnBoardingThings("images/welcome.gif", "Welcome to Skill Up", "We are ready to help you all the way"),
    OnBoardingThings("images/pencil.gif", "All in one place", "Here you can keep everything organized"),
    OnBoardingThings("images/stock.jpg", "Everything is Secured", "Your everything is safe here"),
  ];
}