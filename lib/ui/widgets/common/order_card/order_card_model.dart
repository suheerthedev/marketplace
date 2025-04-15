import 'package:marketplace/models/order_model.dart';
import 'package:stacked/stacked.dart';

class OrderCardModel extends BaseViewModel {
  final Order _order;
  final Function(String) _onCheckStatus;
  final Function(String) _onBuyAgain;

  OrderCardModel({
    required Order order,
    required Function(String) onCheckStatus,
    required Function(String) onBuyAgain,
  })  : _order = order,
        _onCheckStatus = onCheckStatus,
        _onBuyAgain = onBuyAgain;

  Order get order => _order;
  bool get isDelivered => _order.isDelivered;

  void checkStatus() {
    _onCheckStatus(_order.id);
  }

  void buyAgain() {
    _onBuyAgain(_order.id);
  }
}
