import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'write_review_viewmodel.dart';

class WriteReviewView extends StackedView<WriteReviewViewModel> {
  final String? productId;
  final String? productName;

  const WriteReviewView({
    Key? key,
    this.productId,
    this.productName,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WriteReviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Write Review"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Info
                      _buildProductSection(viewModel),
                      const SizedBox(height: 24),

                      // Rating Section
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Overall Rating',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mainTextColor,
                              ),
                            ),
                          ),
                          _buildRatingStars(viewModel),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Review Text Field
                      _buildReviewTextField(viewModel),
                      const SizedBox(height: 24),

                      // Upload Media Section
                      _buildUploadSection(context, viewModel),
                    ],
                  ),
                ),
              ),

              // Error message
              if (viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    viewModel.errorMessage!,
                    style: GoogleFonts.roboto(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),

              // Done Button
              _buildDoneButton(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection(WriteReviewViewModel viewModel) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: lightContainerColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Icon(
              Icons.photo_camera_outlined,
              color: mainTextColor,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            viewModel.productName,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: mainTextColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingStars(WriteReviewViewModel viewModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          child: Icon(
            Icons.star,
            size: 20,
            color: index < viewModel.rating ? Colors.amber : Colors.grey[300],
          ),
          onTap: () => viewModel.setRating(index + 1),
        );
      }),
    );
  }

  Widget _buildReviewTextField(WriteReviewViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'What do you think of the quality and appearance?',
          hintStyle: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: lightTextColor,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: InputBorder.none,
        ),
        onChanged: viewModel.setReviewText,
      ),
    );
  }

  Widget _buildUploadSection(
      BuildContext context, WriteReviewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Photo/Video',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: mainTextColor,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => viewModel.pickMedia(context),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: lightContainerColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: viewModel.hasMedia
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(
                        viewModel.mediaFile!,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: viewModel.clearMedia,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.grey,
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Upload Photo/Video',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: lightTextColor,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoneButton(
      BuildContext context, WriteReviewViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: viewModel.isBusy
            ? null
            : () async {
                if (await viewModel.submitReview()) {
                  // Navigate back if successful
                  Navigator.of(context).pop();
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF996E4E),
          disabledBackgroundColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: viewModel.isBusy
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Done',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  @override
  void onViewModelReady(WriteReviewViewModel viewModel) {
    if (productId != null && productName != null) {
      viewModel.initWithProduct(productId!, productName!);
    }
    super.onViewModelReady(viewModel);
  }

  @override
  WriteReviewViewModel viewModelBuilder(BuildContext context) =>
      WriteReviewViewModel();
}
