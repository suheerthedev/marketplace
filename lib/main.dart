import 'package:flutter/material.dart';
import 'package:marketplace/app/app.bottomsheets.dart';
import 'package:marketplace/app/app.dialogs.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/services/authentication_service.dart';
import 'package:marketplace/services/user_service.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup Stacked services
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  // Initialize user service
  await locator<UserService>().initialize();

  // Initialize authentication service and check login state
  final authService = locator<AuthenticationService>();
  await authService.initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get auth service to check if user is authenticated
    final authService = locator<AuthenticationService>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: secondaryBackgroundColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(backgroundColor: secondaryBackgroundColor),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: secondaryBackgroundColor)),
      // Set initial route based on authentication state
      initialRoute: authService.isAuthenticated
          ? authService.userType == 'seller'
              ? Routes.sellerMainView
              : Routes.mainView
          : Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
