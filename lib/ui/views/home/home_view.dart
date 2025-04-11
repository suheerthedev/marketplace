import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/widgets/common/category_card/category_card.dart';
import 'package:marketplace/ui/widgets/common/product_card_1/product_card_1.dart';
import 'package:marketplace/ui/widgets/common/search_bar/search_bar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const CustomSearchBar(
            isAppBar: true,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
            child: Column(
              children: [
                // Flash Discounts section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flash Discounts',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Flash Discount Cards
                    CarouselSlider(
                      items: viewModel.cardList.map((item) {
                        final cardColor = item['color'] ?? Colors.brown;
                        final cardTitle = item['title'] ?? '';
                        final cardImage = item['image'] ?? '';

                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cardTitle,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 100,
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            backgroundColor: Colors.white,
                                            foregroundColor: cardColor,
                                          ),
                                          child: Text(
                                            "Shop now!",
                                            style: GoogleFonts.roboto(
                                              color: cardColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    cardImage,
                                    height: 50,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 150,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 0.9,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Animated Brand Logos
                    Container(
                      color: const Color(0xFFF7F7F7),
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.brandLogos.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              viewModel.brandLogos[index],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Categories
                    Text(
                      'Categories',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Category Icons
                    const SizedBox(
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(
                            name: 'Amplifiers',
                            imagePath:
                                'assets/images/category_items/item_1.png',
                            icon: Icons.radio,
                          ),
                          CategoryCard(
                            name: 'Turntables',
                            imagePath:
                                'assets/images/category_items/item_2.png',
                            icon: Icons.album,
                          ),
                          CategoryCard(
                            name: 'CD Players',
                            imagePath:
                                'assets/images/category_items/item_3.png',
                            icon: Icons.album_outlined,
                          ),
                          CategoryCard(
                            name: 'Cassette Players',
                            imagePath:
                                'assets/images/category_items/item_4.png',
                            icon: Icons.podcasts,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Products Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: viewModel.products.length,
                      itemBuilder: (context, index) {
                        final product = viewModel.products[index];

                        return ProductCard1(
                          product: product,
                          isTappable: true,
                          onTapped: () {
                            viewModel.navigationSerivce
                                .navigateToProductDetailView(product: product);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
