import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/models/order_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrdersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final List<Order> _orders = [
    Order(
      id: '1',
      productName: 'Sony Cd Player',
      price: 60.00,
      imageUrl: 'assets/images/cassette.png',
      status: 'Pending',
    ),
    Order(
      id: '2',
      productName: 'Sony Cd Player',
      price: 60.00,
      imageUrl: 'assets/images/cassette.png',
      status: 'Delivered',
      deliveryDate: '25 Feb 21:23',
    ),
  ];

  List<Order> get orders => _orders;

  void checkStatus(String orderId) {
    // In a real app, this would navigate to an order status screen
    // or make an API call to get the latest status
    _navigationService.navigateToCheckOrderStatusView();
    print('Checking status for order: $orderId');
  }

  void buyAgain(String orderId) {
    // In a real app, this would add the product to the cart
    // or navigate to the product detail page
    print('Buying again order: $orderId');
  }
}
