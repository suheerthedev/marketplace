import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  // Stack to keep track of tab navigation history
  final List<int> _navigationHistory = [0]; // Start with Home tab

  void changeNavbarIndex(int index) {
    // Don't add to history if switching to the current tab
    if (selectedIndex != index) {
      _navigationHistory.add(index);
    }

    selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void animateToPage(int index) {
    pageController.jumpToPage(index); // Instantly switches page
    changeNavbarIndex(index);
  }

  // Handle back button press
  // Returns true if the app should exit, false if we handled navigation internally
  bool onBackPressed() {
    // If we have navigation history and we're not at the first item
    if (_navigationHistory.length > 1) {
      // Remove the current tab
      _navigationHistory.removeLast();

      // Navigate to the previous tab without adding to history
      final previousTab = _navigationHistory.last;
      selectedIndex = previousTab;
      pageController.jumpToPage(previousTab);
      notifyListeners();

      // Indicate we've handled this back press
      return false;
    }

    // If no history or at the first page, allow exiting the app
    return true;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
