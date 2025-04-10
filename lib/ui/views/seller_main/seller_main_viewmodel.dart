import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SellerMainViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  void changeNavbarIndex(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void animateToPage(int index) {
    pageController.jumpToPage(index); // Instantly switches page
    changeNavbarIndex(index);
  }
}
