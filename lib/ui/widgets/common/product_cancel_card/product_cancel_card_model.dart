import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class CancelStatus {
  static const String successful = 'Cancelled Successfully';
}

class ProductCancelCardModel extends BaseViewModel {
  final Map<String, dynamic> _product;
  final VoidCallback? _onCardTap;

  ProductCancelCardModel({
    required Map<String, dynamic> product,
    VoidCallback? onCardTap,
  })  : _product = product,
        _onCardTap = onCardTap;

  Map<String, dynamic> get product => _product;
  VoidCallback? get onCardTap => _onCardTap;
}
