import 'package:marketplace/app/app.dialogs.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyerProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  String _name = 'Romina';
  String _email = 'abc@gmail.com';
  String _password = '********';
  String _address = 'address here';
  String _profileImagePath = 'assets/images/profile.png';

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get address => _address;
  String get profileImagePath => _profileImagePath;

  // Setters that notify UI of changes
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  // Methods
  void updateProfilePicture() {
    // In a real app, this would open image picker and update the profile image
    notifyListeners();
  }

  void saveProfile() {
    // In a real app, this would save the profile data to a backend service
    _navigationService.back();
    notifyListeners();
  }

  void logout() {
    // In a real app, this would handle the logout process
    _dialogService.showCustomDialog(
        variant: DialogType.confirmation,
        title: "Are you sure you want to logout?",
        mainButtonTitle: "Logout",
        secondaryButtonTitle: "Cancel");
  }
}
