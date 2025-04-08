import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'main_page_viewmodel.dart';

class MainPageView extends StackedView<MainPageViewModel> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                              GoogleFonts.hankenGrotesk(color: lightTextColor),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.search, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ),

            // Flash Discounts section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flash Discounts',
                        style: GoogleFonts.hankenGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cardTitle,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.hankenGrotesk(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
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
                                              style: GoogleFonts.hankenGrotesk(
                                                color: cardColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
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

                      // Brands Section
                      Container(
                        color: Color(0xFFF7F7F7),
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.brandLogos.length,
                          itemBuilder: (context, index) {
                            return SvgPicture.asset(
                              viewModel.brandLogos[index],
                              height:
                                  20, // test if it’s rendering in black on black bg
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Categories
                      Text(
                        'Categories',
                        style: GoogleFonts.hankenGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Category Icons
                      SizedBox(
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCategory(Icons.radio, 'Amplifiers'),
                            _buildCategory(Icons.album, 'Turntables'),
                            _buildCategory(Icons.album_outlined, 'CD Players'),
                            _buildCategory(Icons.podcasts, 'Cassette Players'),
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
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return _buildProductCard();
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: secondaryBackgroundColor,
        indicatorColor: Colors.transparent,
        selectedIndex: viewModel.selectedIndex,
        onDestinationSelected: viewModel.changeNavbarIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: "Saved",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(IconData icon, String name) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  '4.0/5',
                  style: GoogleFonts.hankenGrotesk(fontSize: 12),
                ),
              ],
            ),
          ),

          // Product Image
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/casate_1.svg',
                    width: 80,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Product Info
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sony Cd Player',
                  style: GoogleFonts.hankenGrotesk(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$ 60',
                      style: GoogleFonts.hankenGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-10%',
                        style: GoogleFonts.hankenGrotesk(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  MainPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainPageViewModel();
}
