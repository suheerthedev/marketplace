import 'package:flutter/material.dart';
import 'package:marketplace/models/transaction_model.dart';
import 'package:stacked/stacked.dart';

class SellerMyWalletViewModel extends BaseViewModel {
  String selectedTab = 'Transactions';
  bool isSelected = false;
  List<Transaction> transactions = [];
  List<Transaction> allTransactions = [
    Transaction(
        title: 'Withdraw to ***456',
        amount: '- \$100',
        date: '29 Aug 2024',
        type: 'Withdrawal'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
  ];
  List<Transaction> withdrawals = [
    Transaction(
        title: 'Withdraw to ***456',
        amount: '- \$100',
        date: '29 Aug 2024',
        type: 'Withdrawal')
  ];
  List<Transaction> incomes = [
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
    Transaction(
        title: 'Referral Income',
        amount: '+ \$50',
        date: '29 Aug 2024',
        type: 'Income'),
  ];

  void setSelectedTab(String tab) {
    selectedTab = tab;
    getTransactions(); // Update transactions when tab changes
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  void getTransactions() {
    if (selectedTab == 'Transactions') {
      transactions = [...withdrawals, ...incomes];
    } else if (selectedTab == 'Withdrawals') {
      transactions = withdrawals;
    } else if (selectedTab == 'Incomes') {
      transactions = incomes;
    }
  }
}
