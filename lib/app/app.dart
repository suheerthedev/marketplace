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
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
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
