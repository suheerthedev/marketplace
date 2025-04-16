import 'package:stacked/stacked.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/models/product_model.dart';

class StoreHomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Store information
  final String storeName = "Abc Store";
  final String storeRating = "93";
  bool isFollowing = false;

  // Latest additions
  final List<Product> latestProducts = [
    Product(
      id: "1",
      title: "Sony Cd Player",
      description: "High-quality CD player with excellent sound",
      brandImagePath: "assets/images/brands/sony.png",
      sizes: ["S", "M", "L"],
      imagePath: "assets/images/cassette.png",
      price: 60,
      discount: 10,
      rating: 4.5,
      companyName: "Sony",
      reviews: [],
    ),
    Product(
      id: "2",
      title: "Sony Cd Player",
      description: "High-quality CD player with excellent sound",
      brandImagePath: "assets/images/brands/sony.png",
      sizes: ["S", "M", "L"],
      imagePath: "assets/images/cassette.png",
      price: 60,
      discount: 0,
      rating: 4.0,
      companyName: "Sony",
      reviews: [],
    ),
    Product(
      id: "3",
      title: "Sony Cd Player",
      description: "High-quality CD player with excellent sound",
      brandImagePath: "assets/images/brands/sony.png",
      sizes: ["S", "M", "L"],
      imagePath: "assets/images/cassette.png",
      price: 60,
      discount: 0,
      rating: 4.0,
      companyName: "Sony",
      reviews: [],
    ),
  ];

  // Hottest deals
  final List<Product> hottestDeals = [
    Product(
      id: "4",
      title: "Sony Cd Player",
      description: "High-quality CD player with excellent sound",
      brandImagePath: "assets/images/brands/sony.png",
      sizes: ["S", "M", "L"],
      imagePath: "assets/images/cassette.png",
      price: 60,
      discount: 30,
      rating: 4.7,
      companyName: "Sony",
      reviews: [],
    ),
    Product(
      id: "5",
      title: "Sony Cd Player",
      description: "High-quality CD player with excellent sound",
      brandImagePath: "assets/images/brands/sony.png",
      sizes: ["S", "M", "L"],
      imagePath: "assets/images/cassette.png",
      price: 60,
      discount: 30,
      rating: 4.7,
      companyName: "Sony",
      reviews: [],
    ),
    Product(
      id: "6",
      title: "Sony Cd Player",
      description: "High-quality CD player with excellent sound",
      brandImagePath: "assets/images/brands/sony.png",
      sizes: ["S", "M", "L"],
      imagePath: "assets/images/cassette.png",
      price: 60,
      discount: 30,
      rating: 4.7,
      companyName: "Sony",
      reviews: [],
    ),
  ];

  // UI actions
  void toggleFollow() {
    isFollowing = !isFollowing;
    notifyListeners();
  }

  void onProductTap(Product product) {
    // Navigate to product detail
    _navigationService.navigateToProductDetailView(
      product: product,
    );
  }

  void onSearchTap() {
    // Navigate to search or show search modal
    // TODO: Implement search functionality
  }

  void onCartTap() {
    _navigationService.navigateToCartView();
  }

  void onNotificationTap() {
    _navigationService.navigateToNotificationView();
  }

  void navigateToBottomTab(int index) {
    // TODO: Implement navigation to bottom tabs
  }
}
