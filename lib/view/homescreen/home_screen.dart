import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api/helpers/colors.dart';
import 'package:store_api/view/categoryscreen/category_screen.dart';
import 'package:store_api/view/widgets/products.dart';
import 'package:store_api/view/widgets/salecarousel.dart';

import '../productscreen/allproduct_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const CategoryScreen()));
                },
                icon: const Icon(IconlyBold.category))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: AppColors().lightIconsColor)),
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      size: 27,
                      color: AppColors().lightIconsColor,
                    )),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        // swiper widget for carousel
                        child: Swiper(
                          itemCount: 3,
                          autoplay: true,
                          pagination: const SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Colors.red)),
                          itemBuilder: (context, index) {
                            //sale carousel class
                            return const SaleCarouselWidget();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'Latest Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const AllProducts()));
                              },
                              icon: Icon(
                                IconlyBold.arrowRight2,
                                color: AppColors().lightIconsColor,
                              ))
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 0.0,
                                childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return const ProductsWidget();
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
