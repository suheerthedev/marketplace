import 'package:stacked/stacked.dart';

class ProductCard2Model extends BaseViewModel {
  int counter = 0;

  void incrementCounter() {
    counter++;
    rebuildUi();
  }

  void decrementCounter() {
    if (counter == 0) {
      counter = 0;
    } else {
      counter--;
    }
    rebuildUi();
  }
}
