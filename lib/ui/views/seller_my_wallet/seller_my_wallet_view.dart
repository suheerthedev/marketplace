import 'package:flutter/material.dart';
import 'package:marketplace/models/transaction_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seller_my_wallet_viewmodel.dart';

class SellerMyWalletView extends StackedView<SellerMyWalletViewModel> {
  const SellerMyWalletView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerMyWalletViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: 'My Wallet'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardSection(),
            const SizedBox(height: 20),
            _buildTabSection(viewModel),
            const SizedBox(height: 10),
            Expanded(child: _buildTransactionList(viewModel)),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSection() {
    return SizedBox(
      height: 160,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          childAspectRatio: 0.55,
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildCard('2569', '****9876', 'Mastercard');
        },
      ),
    );
  }

  Widget _buildCard(String amount, String cardNumber, String cardType) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0XFF808080),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/mastercard.png',
              ),
              const Spacer(),
              Text(
                cardType,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '\$$amount',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cardNumber,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection(SellerMyWalletViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabButton(viewModel,
            title: 'Transactions',
            isSelected: viewModel.selectedTab == 'Transactions'),
        _buildTabButton(viewModel,
            title: 'Withdrawals',
            isSelected: viewModel.selectedTab == 'Withdrawals'),
        _buildTabButton(viewModel,
            title: 'Incomes', isSelected: viewModel.selectedTab == 'Incomes'),
      ],
    );
  }

  Widget _buildTabButton(SellerMyWalletViewModel viewModel,
      {required String title, required bool isSelected}) {
    return TextButton(
      onPressed: () {
        if (!isSelected) {
          viewModel.setSelectedTab(title);
        }
      },
      style: TextButton.styleFrom(
        backgroundColor:
            isSelected ? lightBackgroundColor : secondaryBackgroundColor,
        foregroundColor: isSelected ? mainTextColor : mainTextColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: lightBackgroundColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTransactionList(SellerMyWalletViewModel viewModel) {
    // Get all transactions based on the selected tab
    viewModel.getTransactions();

    return ListView(
      children: viewModel.transactions.map((transaction) {
        return _buildTransactionItem(transaction);
      }).toList(),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.receipt_long, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  transaction.date,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction.amount,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: mainBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  SellerMyWalletViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerMyWalletViewModel();
}
