import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainPageViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  List<Map<String, dynamic>> cardList = [
    {
      'title': 'Get your special\ndiscount up to 50%',
      'color': Colors.brown,
      'image': 'assets/images/retro_1.svg'
    },
    {
      'title': 'Get your special\ndiscount up to 50%',
      'color': const Color.fromARGB(255, 227, 204, 0),
      'image': 'assets/images/casate_1.svg'
    },
    {
      'title': 'Get your special\ndiscount up to 50%',
      'color': const Color.fromARGB(255, 65, 48, 42),
      'image': 'assets/images/retro_1.svg'
    },
    {
      'title': 'Get your special\ndiscount up to 50%',
      'color': Colors.brown,
      'image': 'assets/images/casate_1.svg'
    },
  ];

  List<String> brandLogos = [
    'assets/images/brand_logos/brand_1.svg',
    'assets/images/brand_logos/brand_2.svg',
    'assets/images/brand_logos/brand_3.svg',
    'assets/images/brand_logos/brand_4.svg',
    'assets/images/brand_logos/brand_5.svg',
    'assets/images/brand_logos/brand_6.svg',
    'assets/images/brand_logos/brand_7.svg',
    'assets/images/brand_logos/brand_8.svg',
  ];

  // Method to change bottom navigation index
  void changeNavbarIndex(int index) {
    selectedIndex = index;
    rebuildUi();
  }

  void animateToPage(int index) {
    pageController.jumpToPage(index); // Instantly switches page
    changeNavbarIndex(index);
  }
}
