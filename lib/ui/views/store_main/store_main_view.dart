import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/views/store_home/store_home_view.dart';
import 'package:stacked/stacked.dart';

import 'store_main_viewmodel.dart';

class StoreMainView extends StackedView<StoreMainViewModel> {
  const StoreMainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreMainViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          final shouldPop = viewModel.onBackPressed();
          if (shouldPop) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: viewModel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            viewModel.selectedIndex = index;
            viewModel.notifyListeners();
          },
          children: const [
            StoreHomeView(),
            StoreHomeView(),
            StoreHomeView(),
            StoreHomeView(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: secondaryBackgroundColor,
          indicatorColor: Colors.transparent,
          selectedIndex: viewModel.selectedIndex,
          onDestinationSelected: viewModel.changeNavbarIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.store),
              icon: Icon(Icons.store_outlined),
              label: "Store",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.inventory_2),
              icon: Icon(Icons.inventory_2_outlined),
              label: "Products",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.category),
              icon: Icon(Icons.category_outlined),
              label: "Categories",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.chat),
              icon: Icon(Icons.chat_outlined),
              label: "Chat",
            ),
          ],
        ),
      ),
    );
  }

  @override
  StoreMainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreMainViewModel();
}
