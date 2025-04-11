import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seller_chat_viewmodel.dart';

class SellerChatView extends StackedView<SellerChatViewModel> {
  const SellerChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thomas Jepkins',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Active 4m ago',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildReceivedMessage('Hello there!'),
                  _buildReceivedMessage(
                      'I was looking on Internet and I saw this product from you guys!'),
                  _buildDateLabel('Mon 20, Jan'),
                  _buildSentMessage('Hi there! Nice to meet you!.'),
                  _buildSentMessage(
                      "I'm John and today I'm going to help you to find your best product."),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildMessageInputField(),
    );
  }

  Widget _buildReceivedMessage(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSentMessage(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDateLabel(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        date,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              // Implement send message functionality
            },
          ),
        ],
      ),
    );
  }

  @override
  SellerChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerChatViewModel();
}
