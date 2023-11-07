import 'package:flutter/material.dart';
import 'package:store_api/model/product_model.dart';
import 'package:store_api/view/widgets/products.dart';

class AllProducts extends StatelessWidget {
  final List<ProductModel> productList;
  const AllProducts({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              //shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return ProductsWidget(
                  imageUrl: productList[index].images![0],
                  title: productList[index].title.toString(),
                  price: productList[index].price.toString(),
                  id: productList[index].id!.toInt(),
                );
              },
            ),
    );
  }
}
