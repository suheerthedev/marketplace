import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VoucherViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  List vouchers = [
    'assets/images/voucher.png',
    'assets/images/voucher.png',
  ];

  void viewVoucher() {
    _navigationService.navigateToRedeemVoucherView();
  }
}
