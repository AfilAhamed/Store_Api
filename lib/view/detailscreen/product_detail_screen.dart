import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api/helpers/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            const BackButton(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 3,
                          child: Text(
                            'dummy',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                      Flexible(
                          flex: 1,
                          child: RichText(
                              text: TextSpan(
                                  text: '\$',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Color.fromRGBO(33, 150, 243, 1)),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "168.00",
                                    style: TextStyle(
                                        color: AppColors().lightTextColor,
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
                    imageUrl: '',
                    boxFit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: 3,
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
