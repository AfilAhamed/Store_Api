import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api/controller/details_controller.dart';
import 'package:store_api/helpers/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  //get products at once
  @override
  void initState() {
    final detailsProvider =
        Provider.of<ProductDetailsController>(context, listen: false);
    detailsProvider.getsingleproducts(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //provider
    final detailsProvider = Provider.of<ProductDetailsController>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: detailsProvider.productModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackButton(
                            color: AppColors().lightIconsColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailsProvider.productModel!.category!.name
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 3,
                                    child: Text(
                                      detailsProvider.productModel!.title
                                          .toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Flexible(
                                    flex: 1,
                                    child: RichText(
                                        text: TextSpan(
                                            text: '\$',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                color: Color.fromRGBO(
                                                    33, 150, 243, 1)),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: detailsProvider
                                                  .productModel!.price
                                                  .toString(),
                                              style: TextStyle(
                                                  color: AppColors()
                                                      .lightTextColor,
                                                  fontWeight: FontWeight.bold))
                                        ])))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.4,
                        child: Swiper(
                          itemBuilder: (context, index) {
                            return FancyShimmerImage(
                              width: double.infinity,
                              imageUrl: detailsProvider
                                  .productModel!.images![index]
                                  .toString(),
                              boxFit: BoxFit.fill,
                            );
                          },
                          autoplay: true,
                          itemCount: 3,
                          pagination: const SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Colors.red)),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              detailsProvider.productModel!.description
                                  .toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
