import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/widgets/common/product_return_card/product_return_card_model.dart';
import 'package:marketplace/ui/widgets/common/product_cancel_card/product_cancel_card_model.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerReturnCancelViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  int _currentTabIndex = 0;

  final List<Map<String, dynamic>> _cancelledProducts = [
    {
      'id': '1',
      'storeName': 'Store Name',
      'productName': 'Product name',
      'subtotal': 170,
      'status': CancelStatus.successful,
    },
    {
      'id': '2',
      'storeName': 'Store Name',
      'productName': 'Product name',
      'subtotal': 170,
      'status': CancelStatus.successful,
    },
  ];

  final List<Map<String, dynamic>> _returnedProducts = [
    {
      'id': '1',
      'storeName': 'Store Name',
      'productName': 'Product name',
      'subtotal': 170,
      'status': ReturnStatus.unpaid,
    },
    {
      'id': '2',
      'storeName': 'Store Name',
      'productName': 'Product name',
      'subtotal': 170,
      'status': ReturnStatus.successful,
    },
    {
      'id': '3',
      'storeName': 'Store Name',
      'productName': 'Product name',
      'subtotal': 170,
      'status': ReturnStatus.requestRefund,
    },
    {
      'id': '4',
      'storeName': 'Store Name',
      'productName': 'Product name',
      'subtotal': 170,
      'status': ReturnStatus.trackRefund,
    },
  ];

  // Getters
  int get currentTabIndex => _currentTabIndex;
  List<Map<String, dynamic>> get cancelledProducts => _cancelledProducts;
  List<Map<String, dynamic>> get returnedProducts => _returnedProducts;

  // Methods
  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void onProductTap(String productId) {
    // Navigate to product details
    print('Product tapped: $productId');
  }

  void onRequestRefund(String productId) {
    // Navigate to refund request screen
    _navigationService.navigateToRefundRequestView();
    print('Request refund for product: $productId');
  }

  void onTrackRefund(String productId) {
    // Navigate to refund tracking screen
    _navigationService.navigateToTrackRefundView();
    print('Track refund for product: $productId');
  }
}
