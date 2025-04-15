import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';

class RefundRequestViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // Product details, could be passed in from the previous screen
  final Map<String, dynamic> _productDetails = {
    'companyName': 'Company name',
    'productName': 'Product name',
    'deliveryDate': '22-feb-2025',
  };

  // Selected reason
  String? _selectedReason;
  String _otherReason = '';

  // Getters
  Map<String, dynamic> get productDetails => _productDetails;
  String? get selectedReason => _selectedReason;
  String get otherReason => _otherReason;

  // Cancellation reasons
  final List<String> _reasons = [
    'Delivery time too long',
    'Order place by mistake',
    'Change of mind',
    'Delivery time too long',
    'Order place by mistake',
    'Change of mind',
  ];

  List<String> get reasons => _reasons;

  // Is form valid
  bool get isFormValid => _selectedReason != null || _otherReason.isNotEmpty;

  // Methods
  void setSelectedReason(String? reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  void setOtherReason(String value) {
    _otherReason = value;
    notifyListeners();
  }

  Future<void> submitRequest() async {
    _navigationService.back();
  }
}
