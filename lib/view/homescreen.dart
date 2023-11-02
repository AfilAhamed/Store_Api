import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api/helpers/colors.dart';
import 'package:store_api/view/widgets/salecarousel.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(IconlyBold.category))),
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
              SizedBox(
                height: 15,
              ),
              const SaleCarousel()
            ],
          ),
        ),
      ),
    );
  }
}
