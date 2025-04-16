import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}

class BuyerHelpCenterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: 'How can I sure that products are authentic?',
      answer:
          'We verify our sellers and encourage them to provide detailed product descriptions, images, and proof of authenticity. Additionally, buyers can review seller ratings and ask questions before making a purchase.',
    ),
    FAQItem(
      question: 'Can I test the product before purchasing?',
      answer:
          'Some sellers offer product demonstrations or trial periods. Check the product listing for details or contact the seller directly to inquire about testing options.',
    ),
    FAQItem(
      question: 'What payment methods do you accept?',
      answer:
          'We accept various payment methods including credit/debit cards, digital wallets, bank transfers, and cash on delivery for eligible orders.',
    ),
    FAQItem(
      question: 'Do you offer financing options?',
      answer:
          'Yes, we offer financing options for qualifying purchases. You can check eligibility during checkout or contact customer support for more information.',
    ),
  ];

  List<FAQItem> get faqItems => _faqItems;

  void toggleExpansion(int index) {
    _faqItems[index].isExpanded = !_faqItems[index].isExpanded;
    notifyListeners();
  }

  void navigateToChatbot() {
    _navigationService.navigateToChatbotView();
  }
}
