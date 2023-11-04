import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api/helpers/colors.dart';
import 'package:store_api/model/category_model.dart';
import 'package:store_api/services/category_services.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> categoriesList = [];

  // @override
  // void initState() {
  //   getCategories();
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    getCategories();
    super.didChangeDependencies();
  }

  Future<void> getCategories() async {
    categoriesList = await CategoryServices.getAllCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: categoriesList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: categoriesList.length,
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
                            imageUrl: categoriesList[index].image.toString()),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          categoriesList[index].name.toString(),
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
