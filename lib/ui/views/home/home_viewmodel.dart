import 'package:flutter/material.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final navigationSerivce = locator<NavigationService>();
  final PageController pageController = PageController();

  final ProductService productService = locator<ProductService>();

  List<Product> get products => productService.products;
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

  final List<String> brandLogos = [
    'assets/images/brand_logos/brand_1.svg',
    'assets/images/brand_logos/brand_2.svg',
    'assets/images/brand_logos/brand_3.svg',
    'assets/images/brand_logos/brand_4.svg',
    'assets/images/brand_logos/brand_5.svg',
    'assets/images/brand_logos/brand_6.svg',
    'assets/images/brand_logos/brand_7.svg',
    'assets/images/brand_logos/brand_8.svg',
  ];

  List<Map> categoryList = [
    {
      'title': 'Amplifier',
      'image': 'assets/images/category_items/item_1.png',
    },
    {
      'title': 'Turntables',
      'image': 'assets/images/category_items/item_2.png',
    },
    {
      'title': 'CD Players',
      'image': 'assets/images/category_items/item_3.png',
    },
    {
      'title': 'Cassette Players',
      'image': 'assets/images/category_items/item_4.png',
    },
  ];
}
