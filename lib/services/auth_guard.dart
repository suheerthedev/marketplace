import 'package:flutter/material.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthGuard implements StackedRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final authService = locator<AuthenticationService>();
    final navigationService = locator<NavigationService>();

    if (authService.isAuthenticated) {
      // User is authenticated, allow navigation
      resolver.next(true);
    } else {
      // User is not authenticated, redirect to login
      await navigationService.navigateToView(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );

      // Navigate to login
      navigationService.clearStackAndShow(Routes.buyerLoginView);

      // Prevent the original navigation
      resolver.next(false);
    }
  }
}

class SellerAuthGuard implements StackedRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final authService = locator<AuthenticationService>();
    final navigationService = locator<NavigationService>();

    if (authService.isAuthenticated && authService.userType == 'seller') {
      // User is authenticated and is a seller, allow navigation
      resolver.next(true);
    } else if (authService.isAuthenticated) {
      // User is authenticated but not a seller, redirect to buyer home
      navigationService.clearStackAndShow(Routes.mainView);
      resolver.next(false);
    } else {
      // User is not authenticated, redirect to login
      await navigationService.navigateToView(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );

      // Navigate to login
      navigationService.clearStackAndShow(Routes.buyerLoginView);

      // Prevent the original navigation
      resolver.next(false);
    }
  }
}
