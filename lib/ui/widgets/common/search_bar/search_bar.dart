import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_bar_model.dart';

class CustomSearchBar extends StackedView<SearchBarModel> {
  final bool isAppBar;
  const CustomSearchBar({super.key, this.isAppBar = false});

  @override
  Widget builder(
    BuildContext context,
    SearchBarModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: isAppBar
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade600,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SearchBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchBarModel();
}
