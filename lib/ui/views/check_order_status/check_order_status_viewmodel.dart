import 'package:stacked/stacked.dart';

class OrderTrackingStep {
  final String title;
  final String timestamp;
  final bool isCompleted;

  OrderTrackingStep({
    required this.title,
    required this.timestamp,
    required this.isCompleted,
  });
}

class CheckOrderStatusViewModel extends BaseViewModel {
  final List<OrderTrackingStep> _trackingSteps = [
    OrderTrackingStep(
      title: 'Order Confirm',
      timestamp: '05:58 PM, 31 Jan 2025',
      isCompleted: true,
    ),
    OrderTrackingStep(
      title: 'Order Dispatch',
      timestamp: '05:58 PM, 31 Jan 2025',
      isCompleted: true,
    ),
    OrderTrackingStep(
      title: 'Delivery',
      timestamp: '05:58 PM, 31 Jan 2025',
      isCompleted: false,
    ),
  ];

  List<OrderTrackingStep> get trackingSteps => _trackingSteps;

  String getOrderId() {
    return '#1234567890';
  }

  String getEstimatedDeliveryTime() {
    return '30 minutes';
  }
}
