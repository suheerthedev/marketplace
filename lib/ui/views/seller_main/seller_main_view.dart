import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/views/seller_dashboard/seller_dashboard_view.dart';
import 'package:marketplace/ui/views/seller_products/seller_products_view.dart';
import 'package:stacked/stacked.dart';

import 'seller_main_viewmodel.dart';

class SellerMainView extends StackedView<SellerMainViewModel> {
  const SellerMainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerMainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: viewModel.pageController,
        onPageChanged: (index) {
          viewModel.selectedIndex = index;
          viewModel.notifyListeners();
        },
        children: const [
          SellerDashboardView(),
          SellerProductsView(),
          SellerDashboardView(),
          SellerDashboardView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: secondaryBackgroundColor,
        indicatorColor: Colors.transparent,
        selectedIndex: viewModel.selectedIndex,
        onDestinationSelected: viewModel.changeNavbarIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Dashboard",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.inventory_2),
            icon: Icon(Icons.inventory_2_outlined),
            label: "Products",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.message_outlined),
            label: "Messages",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }

  @override
  SellerMainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerMainViewModel();
}
