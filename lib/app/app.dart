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
    // @stacked-dialog
  ],
)
class App {}
