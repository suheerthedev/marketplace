import 'package:flutter/material.dart';
import 'package:marketplace/app/app.dialogs.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  List generalItems = [
    {
      'icon': Icons.help_outline,
      'title': 'Help center',
    },
    {
      'icon': Icons.business,
      'title': 'App for business',
    },
    {
      'icon': Icons.description_outlined,
      'title': 'Terms & Policies',
    },
    {
      'icon': Icons.language,
      'title': 'Language - English',
    },
  ];

  void viewProfile() {
    _navigationService.navigateToBuyerProfileView();
  }

  void viewOrders() {
    _navigationService.navigateToOrdersView();
  }

  void viewToPay() {
    _navigationService.navigateToBuyerToPayView();
  }

  void viewToReview() {
    _navigationService.navigateToBuyerToReviewView();
  }

  void viewToReceive() {
    _navigationService.navigateToBuyerToReceiveView();
  }

  void viewOrderReturn() {
    _navigationService.navigateToBuyerReturnCancelView();
  }

  void viewVouchers() {
    _navigationService.navigateToVoucherView();
  }

  void viewHelpCenter() {
    _navigationService.navigateToBuyerHelpCenterView();
  }

  void viewTermsAndPolicies() {
    _navigationService.navigateToPrivacyPolicyView();
  }

  void logout() {
    _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: 'Are you sure you want to logout?',
      mainButtonTitle: 'Logout',
      secondaryButtonTitle: 'Cancel',
    );
  }
}
