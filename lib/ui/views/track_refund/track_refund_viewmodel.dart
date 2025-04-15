import 'package:stacked/stacked.dart';

class TrackRefundViewModel extends BaseViewModel {
  // Return details
  final Map<String, dynamic> _returnDetails = {
    'id': '12345',
    'reason': 'Mention here',
    'quantity': '01',
  };

  // Refund tracking steps
  final List<Map<String, dynamic>> _trackingSteps = [
    {
      'title': 'Return Requested',
      'timestamp': '05:58 PM, 31 Jan 2025',
      'isCompleted': true,
    },
    {
      'title': 'Return Approved',
      'timestamp': '05:58 PM, 31 Jan 2025',
      'isCompleted': true,
    },
    {
      'title': 'Product Picked Up',
      'timestamp': '05:38 PM, 31 Jan 2025',
      'isCompleted': true,
    },
    {
      'title': 'Refund Processed',
      'timestamp': '05:58 PM, 31 Jan 2025',
      'isCompleted': false,
    },
  ];

  // Getters
  Map<String, dynamic> get returnDetails => _returnDetails;
  List<Map<String, dynamic>> get trackingSteps => _trackingSteps;
}
