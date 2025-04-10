import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ProductCard3ViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
