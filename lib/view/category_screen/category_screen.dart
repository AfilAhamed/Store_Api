import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api/controller/category_controller.dart';
import 'package:store_api/helpers/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //provider
    final categoryProvider = Provider.of<CategoryController>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: categoryProvider.categoriesList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: categoryProvider.categoriesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FancyShimmerImage(
                            boxFit: BoxFit.fill,
                            height: size.width * 0.45,
                            width: size.width * 0.45,
                            errorWidget: const Icon(
                              IconlyBold.danger,
                              color: Colors.red,
                              size: 28,
                            ),
                            imageUrl: categoryProvider
                                .categoriesList[index].image
                                .toString()),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          categoryProvider.categoriesList[index].name
                              .toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              backgroundColor:
                                  AppColors().lightCardColor.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
