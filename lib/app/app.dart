import 'package:marketplace/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:marketplace/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:marketplace/ui/views/home/home_view.dart';
import 'package:marketplace/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/ui/views/buyer_sign_up/buyer_sign_up_view.dart';
import 'package:marketplace/ui/views/buyer_login/buyer_login_view.dart';
import 'package:marketplace/ui/views/forgot_password/forgot_password_view.dart';
import 'package:marketplace/ui/views/reset_password/reset_password_view.dart';
import 'package:marketplace/ui/views/main/main_view.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:marketplace/ui/views/product_detail/product_detail_view.dart';
import 'package:marketplace/ui/views/cart/cart_view.dart';
import 'package:marketplace/ui/views/saved/saved_view.dart';
import 'package:marketplace/ui/views/account/account_view.dart';
import 'package:marketplace/ui/views/seller_sign_up/seller_sign_up_view.dart';
import 'package:marketplace/ui/views/seller_dashboard/seller_dashboard_view.dart';
import 'package:marketplace/ui/views/seller_products/seller_products_view.dart';
import 'package:marketplace/ui/views/seller_main/seller_main_view.dart';
import 'package:marketplace/ui/views/seller_inbox/seller_inbox_view.dart';
import 'package:marketplace/ui/views/seller_account/seller_account_view.dart';
import 'package:marketplace/ui/views/seller_chat/seller_chat_view.dart';
import 'package:marketplace/ui/views/seller_profile/seller_profile_view.dart';
import 'package:marketplace/ui/views/seller_my_wallet/seller_my_wallet_view.dart';
import 'package:marketplace/ui/views/seller_help_center/seller_help_center_view.dart';
import 'package:marketplace/ui/dialogs/confirmation/confirmation_dialog.dart';
import 'package:marketplace/ui/views/seller_edit_product/seller_edit_product_view.dart';
import 'package:marketplace/ui/views/seller_add_product/seller_add_product_view.dart';
import 'package:marketplace/ui/views/notification/notification_view.dart';
import 'package:marketplace/ui/views/seller_trending_products/seller_trending_products_view.dart';
import 'package:marketplace/ui/views/seller_invoice_detail/seller_invoice_detail_view.dart';
import 'package:marketplace/ui/views/category/category_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: BuyerSignUpView),
    MaterialRoute(page: BuyerLoginView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ProductDetailView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: SavedView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: SellerSignUpView),
    MaterialRoute(page: SellerDashboardView),
    MaterialRoute(page: SellerProductsView),
    MaterialRoute(page: SellerMainView),
    MaterialRoute(page: SellerInboxView),
    MaterialRoute(page: SellerAccountView),
    MaterialRoute(page: SellerChatView),
    MaterialRoute(page: SellerProfileView),
    MaterialRoute(page: SellerMyWalletView),
    MaterialRoute(page: SellerHelpCenterView),
    MaterialRoute(page: SellerEditProductView),
    MaterialRoute(page: SellerAddProductView),
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: SellerTrendingProductsView),
    MaterialRoute(page: SellerInvoiceDetailView),
    MaterialRoute(page: CategoryView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ProductService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ConfirmationDialog),
// @stacked-dialog
  ],
)
class App {}
