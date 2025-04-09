import 'package:marketplace/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  String selectedSize = 'S';
}
