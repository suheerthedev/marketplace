import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class ReturnStatus {
  static const String unpaid = 'unpaid - no refund';
  static const String successful = 'Return Successful';
  static const String requestRefund = 'Request to Refund';
  static const String trackRefund = 'Track your Refund';
}

class ProductReturnCardModel extends BaseViewModel {
  final Map<String, dynamic> _product;
  final VoidCallback? _onCardTap;
  final VoidCallback? _onActionTap;

  ProductReturnCardModel({
    required Map<String, dynamic> product,
    VoidCallback? onCardTap,
    VoidCallback? onActionTap,
  })  : _product = product,
        _onCardTap = onCardTap,
        _onActionTap = onActionTap;

  Map<String, dynamic> get product => _product;
  VoidCallback? get onCardTap => _onCardTap;
  VoidCallback? get onActionTap => _onActionTap;

  bool get hasActionButton =>
      _product['status'] == ReturnStatus.requestRefund ||
      _product['status'] == ReturnStatus.trackRefund;
}
