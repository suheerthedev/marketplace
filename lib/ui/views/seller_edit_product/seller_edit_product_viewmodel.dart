import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';

class SellerEditProductViewModel extends BaseViewModel {
  int price = 705;
  int quantity = 20;

  // Controllers for text fields
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  // Variable to hold the selected image
  XFile? selectedImage;

  SellerEditProductViewModel() {
    // Initialize controllers with current values
    priceController.text = price.toString();
    quantityController.text = quantity.toString();
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  void onIncrementPrice() {
    price = int.tryParse(priceController.text) ?? price; // Get current value
    price++;
    priceController.text = price.toString(); // Update controller text
    notifyListeners();
  }

  void onDecrementPrice() {
    price = int.tryParse(priceController.text) ?? price; // Get current value
    if (price > 0) {
      price--;
      priceController.text = price.toString(); // Update controller text
      notifyListeners();
    }
  }

  void onIncrementQuantity() {
    quantity =
        int.tryParse(quantityController.text) ?? quantity; // Get current value
    quantity++;
    quantityController.text = quantity.toString(); // Update controller text
    notifyListeners();
  }

  void onDecrementQuantity() {
    quantity =
        int.tryParse(quantityController.text) ?? quantity; // Get current value
    if (quantity > 0) {
      quantity--;
      quantityController.text = quantity.toString(); // Update controller text
      notifyListeners();
    }
  }
}
