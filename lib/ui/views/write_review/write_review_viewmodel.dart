import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class WriteReviewViewModel extends BaseViewModel {
  String _productName = 'Product name/description';
  int _rating = 0;
  String _reviewText = '';
  File? _mediaFile;
  final ImagePicker _picker = ImagePicker();

  // Getters
  String get productName => _productName;
  int get rating => _rating;
  String get reviewText => _reviewText;
  File? get mediaFile => _mediaFile;
  bool get hasMedia => _mediaFile != null;

  // Initialize with product data
  void initWithProduct(String productId, String name) {
    _productName = name;
    notifyListeners();
  }

  // Update rating
  void setRating(int value) {
    if (value >= 1 && value <= 5) {
      _rating = value;
      notifyListeners();
    }
  }

  // Update review text
  void setReviewText(String text) {
    _reviewText = text;
    // No need to notify listeners here as TextFields handle their own state
  }

  // Pick image from gallery or camera
  Future<void> pickMedia(BuildContext context) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        _mediaFile = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      print('Error picking image: $e');
    }
  }

  // Clear selected media
  void clearMedia() {
    _mediaFile = null;
    notifyListeners();
  }

  // Submit review
  Future<bool> submitReview() async {
    // Validate inputs
    if (_rating == 0) {
      setErrorMessage('Please select a rating');
      return false;
    }

    if (_reviewText.trim().isEmpty) {
      setErrorMessage('Please write a review');
      return false;
    }

    // In a real app, this would submit to an API
    // For now, simulate a successful submission
    setBusy(true);
    await Future.delayed(const Duration(seconds: 1));
    setBusy(false);

    return true;
  }

  // Error handling
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
