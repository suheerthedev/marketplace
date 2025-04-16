// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i50;
import 'package:flutter/material.dart';
import 'package:marketplace/models/product_model.dart' as _i51;
import 'package:marketplace/ui/views/account/account_view.dart' as _i12;
import 'package:marketplace/ui/views/buyer_help_center/buyer_help_center_view.dart'
    as _i45;
import 'package:marketplace/ui/views/buyer_login/buyer_login_view.dart' as _i5;
import 'package:marketplace/ui/views/buyer_profile/buyer_profile_view.dart'
    as _i33;
import 'package:marketplace/ui/views/buyer_return_cancel/buyer_return_cancel_view.dart'
    as _i40;
import 'package:marketplace/ui/views/buyer_sign_up/buyer_sign_up_view.dart'
    as _i4;
import 'package:marketplace/ui/views/buyer_to_pay/buyer_to_pay_view.dart'
    as _i36;
import 'package:marketplace/ui/views/buyer_to_receive/buyer_to_receive_view.dart'
    as _i39;
import 'package:marketplace/ui/views/buyer_to_review/buyer_to_review_view.dart'
    as _i37;
import 'package:marketplace/ui/views/cart/cart_view.dart' as _i10;
import 'package:marketplace/ui/views/category/category_view.dart' as _i28;
import 'package:marketplace/ui/views/chatbot/chatbot_view.dart' as _i46;
import 'package:marketplace/ui/views/check_order_status/check_order_status_view.dart'
    as _i35;
import 'package:marketplace/ui/views/checkout/checkout_view.dart' as _i29;
import 'package:marketplace/ui/views/confirmation/confirmation_view.dart'
    as _i31;
import 'package:marketplace/ui/views/forgot_password/forgot_password_view.dart'
    as _i6;
import 'package:marketplace/ui/views/home/home_view.dart' as _i2;
import 'package:marketplace/ui/views/main/main_view.dart' as _i8;
import 'package:marketplace/ui/views/notification/notification_view.dart'
    as _i25;
import 'package:marketplace/ui/views/orders/orders_view.dart' as _i34;
import 'package:marketplace/ui/views/pay_now/pay_now_view.dart' as _i30;
import 'package:marketplace/ui/views/privacy_policy/privacy_policy_view.dart'
    as _i47;
import 'package:marketplace/ui/views/product_detail/product_detail_view.dart'
    as _i9;
import 'package:marketplace/ui/views/redeem_voucher/redeem_voucher_view.dart'
    as _i44;
import 'package:marketplace/ui/views/refund_request/refund_request_view.dart'
    as _i41;
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
import 'package:marketplace/ui/views/seller_invoice_detail/seller_invoice_detail_view.dart'
    as _i27;
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
import 'package:marketplace/ui/views/store_home/store_home_view.dart' as _i49;
import 'package:marketplace/ui/views/terms_conditons/terms_conditons_view.dart'
    as _i48;
import 'package:marketplace/ui/views/track_refund/track_refund_view.dart'
    as _i42;
import 'package:marketplace/ui/views/verification/verification_view.dart'
    as _i32;
import 'package:marketplace/ui/views/voucher/voucher_view.dart' as _i43;
import 'package:marketplace/ui/views/write_review/write_review_view.dart'
    as _i38;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i52;

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

  static const sellerInvoiceDetailView = '/seller-invoice-detail-view';

  static const categoryView = '/category-view';

  static const checkoutView = '/checkout-view';

  static const payNowView = '/pay-now-view';

  static const confirmationView = '/confirmation-view';

  static const verificationView = '/verification-view';

  static const buyerProfileView = '/buyer-profile-view';

  static const ordersView = '/orders-view';

  static const checkOrderStatusView = '/check-order-status-view';

  static const buyerToPayView = '/buyer-to-pay-view';

  static const buyerToReviewView = '/buyer-to-review-view';

  static const writeReviewView = '/write-review-view';

  static const buyerToReceiveView = '/buyer-to-receive-view';

  static const buyerReturnCancelView = '/buyer-return-cancel-view';

  static const refundRequestView = '/refund-request-view';

  static const trackRefundView = '/track-refund-view';

  static const voucherView = '/voucher-view';

  static const redeemVoucherView = '/redeem-voucher-view';

  static const buyerHelpCenterView = '/buyer-help-center-view';

  static const chatbotView = '/chatbot-view';

  static const privacyPolicyView = '/privacy-policy-view';

  static const termsConditonsView = '/terms-conditons-view';

  static const storeHomeView = '/store-home-view';

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
    sellerInvoiceDetailView,
    categoryView,
    checkoutView,
    payNowView,
    confirmationView,
    verificationView,
    buyerProfileView,
    ordersView,
    checkOrderStatusView,
    buyerToPayView,
    buyerToReviewView,
    writeReviewView,
    buyerToReceiveView,
    buyerReturnCancelView,
    refundRequestView,
    trackRefundView,
    voucherView,
    redeemVoucherView,
    buyerHelpCenterView,
    chatbotView,
    privacyPolicyView,
    termsConditonsView,
    storeHomeView,
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
    _i1.RouteDef(
      Routes.sellerInvoiceDetailView,
      page: _i27.SellerInvoiceDetailView,
    ),
    _i1.RouteDef(
      Routes.categoryView,
      page: _i28.CategoryView,
    ),
    _i1.RouteDef(
      Routes.checkoutView,
      page: _i29.CheckoutView,
    ),
    _i1.RouteDef(
      Routes.payNowView,
      page: _i30.PayNowView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i31.ConfirmationView,
    ),
    _i1.RouteDef(
      Routes.verificationView,
      page: _i32.VerificationView,
    ),
    _i1.RouteDef(
      Routes.buyerProfileView,
      page: _i33.BuyerProfileView,
    ),
    _i1.RouteDef(
      Routes.ordersView,
      page: _i34.OrdersView,
    ),
    _i1.RouteDef(
      Routes.checkOrderStatusView,
      page: _i35.CheckOrderStatusView,
    ),
    _i1.RouteDef(
      Routes.buyerToPayView,
      page: _i36.BuyerToPayView,
    ),
    _i1.RouteDef(
      Routes.buyerToReviewView,
      page: _i37.BuyerToReviewView,
    ),
    _i1.RouteDef(
      Routes.writeReviewView,
      page: _i38.WriteReviewView,
    ),
    _i1.RouteDef(
      Routes.buyerToReceiveView,
      page: _i39.BuyerToReceiveView,
    ),
    _i1.RouteDef(
      Routes.buyerReturnCancelView,
      page: _i40.BuyerReturnCancelView,
    ),
    _i1.RouteDef(
      Routes.refundRequestView,
      page: _i41.RefundRequestView,
    ),
    _i1.RouteDef(
      Routes.trackRefundView,
      page: _i42.TrackRefundView,
    ),
    _i1.RouteDef(
      Routes.voucherView,
      page: _i43.VoucherView,
    ),
    _i1.RouteDef(
      Routes.redeemVoucherView,
      page: _i44.RedeemVoucherView,
    ),
    _i1.RouteDef(
      Routes.buyerHelpCenterView,
      page: _i45.BuyerHelpCenterView,
    ),
    _i1.RouteDef(
      Routes.chatbotView,
      page: _i46.ChatbotView,
    ),
    _i1.RouteDef(
      Routes.privacyPolicyView,
      page: _i47.PrivacyPolicyView,
    ),
    _i1.RouteDef(
      Routes.termsConditonsView,
      page: _i48.TermsConditonsView,
    ),
    _i1.RouteDef(
      Routes.storeHomeView,
      page: _i49.StoreHomeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.BuyerSignUpView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.BuyerSignUpView(),
        settings: data,
      );
    },
    _i5.BuyerLoginView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.BuyerLoginView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.ResetPasswordView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ResetPasswordView(),
        settings: data,
      );
    },
    _i8.MainView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.MainView(),
        settings: data,
      );
    },
    _i9.ProductDetailView: (data) {
      final args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.ProductDetailView(product: args.product, key: args.key),
        settings: data,
      );
    },
    _i10.CartView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CartView(),
        settings: data,
      );
    },
    _i11.SavedView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SavedView(),
        settings: data,
      );
    },
    _i12.AccountView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.AccountView(),
        settings: data,
      );
    },
    _i13.SellerSignUpView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.SellerSignUpView(),
        settings: data,
      );
    },
    _i14.SellerDashboardView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.SellerDashboardView(),
        settings: data,
      );
    },
    _i15.SellerProductsView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.SellerProductsView(),
        settings: data,
      );
    },
    _i16.SellerMainView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.SellerMainView(),
        settings: data,
      );
    },
    _i17.SellerInboxView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.SellerInboxView(),
        settings: data,
      );
    },
    _i18.SellerAccountView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.SellerAccountView(),
        settings: data,
      );
    },
    _i19.SellerChatView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.SellerChatView(),
        settings: data,
      );
    },
    _i20.SellerProfileView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.SellerProfileView(),
        settings: data,
      );
    },
    _i21.SellerMyWalletView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.SellerMyWalletView(),
        settings: data,
      );
    },
    _i22.SellerHelpCenterView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.SellerHelpCenterView(),
        settings: data,
      );
    },
    _i23.SellerEditProductView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.SellerEditProductView(),
        settings: data,
      );
    },
    _i24.SellerAddProductView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.SellerAddProductView(),
        settings: data,
      );
    },
    _i25.NotificationView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.NotificationView(),
        settings: data,
      );
    },
    _i26.SellerTrendingProductsView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.SellerTrendingProductsView(),
        settings: data,
      );
    },
    _i27.SellerInvoiceDetailView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.SellerInvoiceDetailView(),
        settings: data,
      );
    },
    _i28.CategoryView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.CategoryView(),
        settings: data,
      );
    },
    _i29.CheckoutView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.CheckoutView(),
        settings: data,
      );
    },
    _i30.PayNowView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i30.PayNowView(),
        settings: data,
      );
    },
    _i31.ConfirmationView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i31.ConfirmationView(),
        settings: data,
      );
    },
    _i32.VerificationView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.VerificationView(),
        settings: data,
      );
    },
    _i33.BuyerProfileView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i33.BuyerProfileView(),
        settings: data,
      );
    },
    _i34.OrdersView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i34.OrdersView(),
        settings: data,
      );
    },
    _i35.CheckOrderStatusView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i35.CheckOrderStatusView(),
        settings: data,
      );
    },
    _i36.BuyerToPayView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i36.BuyerToPayView(),
        settings: data,
      );
    },
    _i37.BuyerToReviewView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i37.BuyerToReviewView(),
        settings: data,
      );
    },
    _i38.WriteReviewView: (data) {
      final args = data.getArgs<WriteReviewViewArguments>(
        orElse: () => const WriteReviewViewArguments(),
      );
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => _i38.WriteReviewView(
            key: args.key,
            productId: args.productId,
            productName: args.productName),
        settings: data,
      );
    },
    _i39.BuyerToReceiveView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i39.BuyerToReceiveView(),
        settings: data,
      );
    },
    _i40.BuyerReturnCancelView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i40.BuyerReturnCancelView(),
        settings: data,
      );
    },
    _i41.RefundRequestView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i41.RefundRequestView(),
        settings: data,
      );
    },
    _i42.TrackRefundView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i42.TrackRefundView(),
        settings: data,
      );
    },
    _i43.VoucherView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i43.VoucherView(),
        settings: data,
      );
    },
    _i44.RedeemVoucherView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i44.RedeemVoucherView(),
        settings: data,
      );
    },
    _i45.BuyerHelpCenterView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i45.BuyerHelpCenterView(),
        settings: data,
      );
    },
    _i46.ChatbotView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i46.ChatbotView(),
        settings: data,
      );
    },
    _i47.PrivacyPolicyView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i47.PrivacyPolicyView(),
        settings: data,
      );
    },
    _i48.TermsConditonsView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i48.TermsConditonsView(),
        settings: data,
      );
    },
    _i49.StoreHomeView: (data) {
      return _i50.MaterialPageRoute<dynamic>(
        builder: (context) => const _i49.StoreHomeView(),
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

  final _i51.Product product;

  final _i50.Key? key;

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

class WriteReviewViewArguments {
  const WriteReviewViewArguments({
    this.key,
    this.productId,
    this.productName,
  });

  final _i50.Key? key;

  final String? productId;

  final String? productName;

  @override
  String toString() {
    return '{"key": "$key", "productId": "$productId", "productName": "$productName"}';
  }

  @override
  bool operator ==(covariant WriteReviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.productId == productId &&
        other.productName == productName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ productId.hashCode ^ productName.hashCode;
  }
}

extension NavigatorStateExtension on _i52.NavigationService {
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
    required _i51.Product product,
    _i50.Key? key,
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

  Future<dynamic> navigateToSellerInvoiceDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerInvoiceDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPayNowView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.payNowView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckOrderStatusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkOrderStatusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerToPayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerToPayView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerToReviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerToReviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWriteReviewView({
    _i50.Key? key,
    String? productId,
    String? productName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.writeReviewView,
        arguments: WriteReviewViewArguments(
            key: key, productId: productId, productName: productName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerToReceiveView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerToReceiveView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerReturnCancelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerReturnCancelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRefundRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.refundRequestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrackRefundView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.trackRefundView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.voucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRedeemVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.redeemVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerHelpCenterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerHelpCenterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatbotView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatbotView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrivacyPolicyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.privacyPolicyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTermsConditonsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.termsConditonsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStoreHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.storeHomeView,
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
    required _i51.Product product,
    _i50.Key? key,
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

  Future<dynamic> replaceWithSellerInvoiceDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerInvoiceDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.categoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPayNowView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.payNowView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckOrderStatusView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkOrderStatusView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerToPayView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerToPayView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerToReviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerToReviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWriteReviewView({
    _i50.Key? key,
    String? productId,
    String? productName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.writeReviewView,
        arguments: WriteReviewViewArguments(
            key: key, productId: productId, productName: productName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerToReceiveView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerToReceiveView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerReturnCancelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerReturnCancelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRefundRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.refundRequestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrackRefundView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.trackRefundView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.voucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRedeemVoucherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.redeemVoucherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerHelpCenterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerHelpCenterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatbotView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatbotView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPrivacyPolicyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.privacyPolicyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTermsConditonsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.termsConditonsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStoreHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.storeHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
