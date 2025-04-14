// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i27;
import 'package:flutter/material.dart';
import 'package:marketplace/models/product_model.dart' as _i28;
import 'package:marketplace/ui/views/account/account_view.dart' as _i12;
import 'package:marketplace/ui/views/buyer_login/buyer_login_view.dart' as _i5;
import 'package:marketplace/ui/views/buyer_sign_up/buyer_sign_up_view.dart'
    as _i4;
import 'package:marketplace/ui/views/cart/cart_view.dart' as _i10;
import 'package:marketplace/ui/views/forgot_password/forgot_password_view.dart'
    as _i6;
import 'package:marketplace/ui/views/home/home_view.dart' as _i2;
import 'package:marketplace/ui/views/main/main_view.dart' as _i8;
import 'package:marketplace/ui/views/notification/notification_view.dart'
    as _i25;
import 'package:marketplace/ui/views/product_detail/product_detail_view.dart'
    as _i9;
import 'package:marketplace/ui/views/reset_password/reset_password_view.dart'
    as _i7;
import 'package:marketplace/ui/views/saved/saved_view.dart' as _i11;
import 'package:marketplace/ui/views/seller_account/seller_account_view.dart'
    as _i18;
import 'package:marketplace/ui/views/seller_add_product/seller_add_product_view.dart'
    as _i24;
import 'package:marketplace/ui/views/seller_chat/seller_chat_view.dart' as _i19;
import 'package:marketplace/ui/views/seller_dashboard/seller_dashboard_view.dart'
    as _i14;
import 'package:marketplace/ui/views/seller_edit_product/seller_edit_product_view.dart'
    as _i23;
import 'package:marketplace/ui/views/seller_help_center/seller_help_center_view.dart'
    as _i22;
import 'package:marketplace/ui/views/seller_inbox/seller_inbox_view.dart'
    as _i17;
import 'package:marketplace/ui/views/seller_main/seller_main_view.dart' as _i16;
import 'package:marketplace/ui/views/seller_my_wallet/seller_my_wallet_view.dart'
    as _i21;
import 'package:marketplace/ui/views/seller_products/seller_products_view.dart'
    as _i15;
import 'package:marketplace/ui/views/seller_profile/seller_profile_view.dart'
    as _i20;
import 'package:marketplace/ui/views/seller_sign_up/seller_sign_up_view.dart'
    as _i13;
import 'package:marketplace/ui/views/seller_trending_products/seller_trending_products_view.dart'
    as _i26;
import 'package:marketplace/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i29;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const buyerSignUpView = '/buyer-sign-up-view';

  static const buyerLoginView = '/buyer-login-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const resetPasswordView = '/reset-password-view';

  static const mainView = '/main-view';

  static const productDetailView = '/product-detail-view';

  static const cartView = '/cart-view';

  static const savedView = '/saved-view';

  static const accountView = '/account-view';

  static const sellerSignUpView = '/seller-sign-up-view';

  static const sellerDashboardView = '/seller-dashboard-view';

  static const sellerProductsView = '/seller-products-view';

  static const sellerMainView = '/seller-main-view';

  static const sellerInboxView = '/seller-inbox-view';

  static const sellerAccountView = '/seller-account-view';

  static const sellerChatView = '/seller-chat-view';

  static const sellerProfileView = '/seller-profile-view';

  static const sellerMyWalletView = '/seller-my-wallet-view';

  static const sellerHelpCenterView = '/seller-help-center-view';

  static const sellerEditProductView = '/seller-edit-product-view';

  static const sellerAddProductView = '/seller-add-product-view';

  static const notificationView = '/notification-view';

  static const sellerTrendingProductsView = '/seller-trending-products-view';

  static const all = <String>{
    homeView,
    startupView,
    buyerSignUpView,
    buyerLoginView,
    forgotPasswordView,
    resetPasswordView,
    mainView,
    productDetailView,
    cartView,
    savedView,
    accountView,
    sellerSignUpView,
    sellerDashboardView,
    sellerProductsView,
    sellerMainView,
    sellerInboxView,
    sellerAccountView,
    sellerChatView,
    sellerProfileView,
    sellerMyWalletView,
    sellerHelpCenterView,
    sellerEditProductView,
    sellerAddProductView,
    notificationView,
    sellerTrendingProductsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.buyerSignUpView,
      page: _i4.BuyerSignUpView,
    ),
    _i1.RouteDef(
      Routes.buyerLoginView,
      page: _i5.BuyerLoginView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i7.ResetPasswordView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i8.MainView,
    ),
    _i1.RouteDef(
      Routes.productDetailView,
      page: _i9.ProductDetailView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i10.CartView,
    ),
    _i1.RouteDef(
      Routes.savedView,
      page: _i11.SavedView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i12.AccountView,
    ),
    _i1.RouteDef(
      Routes.sellerSignUpView,
      page: _i13.SellerSignUpView,
    ),
    _i1.RouteDef(
      Routes.sellerDashboardView,
      page: _i14.SellerDashboardView,
    ),
    _i1.RouteDef(
      Routes.sellerProductsView,
      page: _i15.SellerProductsView,
    ),
    _i1.RouteDef(
      Routes.sellerMainView,
      page: _i16.SellerMainView,
    ),
    _i1.RouteDef(
      Routes.sellerInboxView,
      page: _i17.SellerInboxView,
    ),
    _i1.RouteDef(
      Routes.sellerAccountView,
      page: _i18.SellerAccountView,
    ),
    _i1.RouteDef(
      Routes.sellerChatView,
      page: _i19.SellerChatView,
    ),
    _i1.RouteDef(
      Routes.sellerProfileView,
      page: _i20.SellerProfileView,
    ),
    _i1.RouteDef(
      Routes.sellerMyWalletView,
      page: _i21.SellerMyWalletView,
    ),
    _i1.RouteDef(
      Routes.sellerHelpCenterView,
      page: _i22.SellerHelpCenterView,
    ),
    _i1.RouteDef(
      Routes.sellerEditProductView,
      page: _i23.SellerEditProductView,
    ),
    _i1.RouteDef(
      Routes.sellerAddProductView,
      page: _i24.SellerAddProductView,
    ),
    _i1.RouteDef(
      Routes.notificationView,
      page: _i25.NotificationView,
    ),
    _i1.RouteDef(
      Routes.sellerTrendingProductsView,
      page: _i26.SellerTrendingProductsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.BuyerSignUpView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.BuyerSignUpView(),
        settings: data,
      );
    },
    _i5.BuyerLoginView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.BuyerLoginView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.ResetPasswordView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ResetPasswordView(),
        settings: data,
      );
    },
    _i8.MainView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.MainView(),
        settings: data,
      );
    },
    _i9.ProductDetailView: (data) {
      final args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.ProductDetailView(product: args.product, key: args.key),
        settings: data,
      );
    },
    _i10.CartView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CartView(),
        settings: data,
      );
    },
    _i11.SavedView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SavedView(),
        settings: data,
      );
    },
    _i12.AccountView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.AccountView(),
        settings: data,
      );
    },
    _i13.SellerSignUpView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.SellerSignUpView(),
        settings: data,
      );
    },
    _i14.SellerDashboardView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.SellerDashboardView(),
        settings: data,
      );
    },
    _i15.SellerProductsView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.SellerProductsView(),
        settings: data,
      );
    },
    _i16.SellerMainView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.SellerMainView(),
        settings: data,
      );
    },
    _i17.SellerInboxView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.SellerInboxView(),
        settings: data,
      );
    },
    _i18.SellerAccountView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.SellerAccountView(),
        settings: data,
      );
    },
    _i19.SellerChatView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.SellerChatView(),
        settings: data,
      );
    },
    _i20.SellerProfileView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.SellerProfileView(),
        settings: data,
      );
    },
    _i21.SellerMyWalletView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.SellerMyWalletView(),
        settings: data,
      );
    },
    _i22.SellerHelpCenterView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.SellerHelpCenterView(),
        settings: data,
      );
    },
    _i23.SellerEditProductView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.SellerEditProductView(),
        settings: data,
      );
    },
    _i24.SellerAddProductView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.SellerAddProductView(),
        settings: data,
      );
    },
    _i25.NotificationView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.NotificationView(),
        settings: data,
      );
    },
    _i26.SellerTrendingProductsView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.SellerTrendingProductsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ProductDetailViewArguments {
  const ProductDetailViewArguments({
    required this.product,
    this.key,
  });

  final _i28.Product product;

  final _i27.Key? key;

  @override
  String toString() {
    return '{"product": "$product", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ProductDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.product == product && other.key == key;
  }

  @override
  int get hashCode {
    return product.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i29.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerSignUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerLoginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductDetailView({
    required _i28.Product product,
    _i27.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.productDetailView,
        arguments: ProductDetailViewArguments(product: product, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSavedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.savedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerSignUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerMainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerInboxView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerInboxView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerChatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerMyWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerMyWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerHelpCenterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerHelpCenterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerEditProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerEditProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerAddProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerAddProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerTrendingProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerTrendingProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerSignUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerLoginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductDetailView({
    required _i28.Product product,
    _i27.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.productDetailView,
        arguments: ProductDetailViewArguments(product: product, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSavedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.savedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerSignUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerMainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerInboxView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerInboxView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerChatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerMyWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerMyWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerHelpCenterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerHelpCenterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerEditProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerEditProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerAddProductView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerAddProductView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerTrendingProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerTrendingProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
