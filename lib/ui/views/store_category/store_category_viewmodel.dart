import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoreCategoryViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final ProductService productService = locator<ProductService>();

  List<Product> get products => productService.products;

  List categories = [
    {
      'image': 'assets/images/amplifier.png',
      'title': 'Amplifier',
    },
    {
      'image': 'assets/images/cd_player.png',
      'title': 'CD Player',
    },
    {
      'image': 'assets/images/turntable.png',
      'title': 'Turntable',
    },
    {
      'image': 'assets/images/cassette_player.png',
      'title': 'Cassette Player',
    },
  ];

  void onSearchTap() {}
  void onCartTap() {}
  void onNotificationTap() {}
}
