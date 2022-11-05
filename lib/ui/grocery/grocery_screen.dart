import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/ui/grocery/address_widget.dart';
import 'package:flutter_task/ui/grocery/category_widget.dart';
import 'package:flutter_task/ui/grocery/grocery_controller.dart';
import 'package:flutter_task/ui/grocery/product_widget.dart';
import 'package:flutter_task/ui/grocery/search_widget.dart';
import 'package:flutter_task/widgets/top_screen_widget.dart';
import 'package:get/get.dart';

class GroceryScreen extends GetView<GroceryController> {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopScreenWidget(),
                const SizedBox(
                  height: 10,
                ),
                const SearchWidget(),
                const SizedBox(
                  height: 20,
                ),
                _buildAddressList(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Explore By Category",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "See All (20)",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildCategoriesList(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Deals of the day",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildProductsList(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://thumbs.dreamstime.com/b/special-offer-banner-red-design-web-149598468.jpg"),
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return Obx(() => SizedBox(
          height: 68.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Obx(() => ProductWidget(
                    controller.products[index],
                    favoriteChanged: (isFavorite) {
                      controller.products[index].isFavorite = isFavorite;
                    },
                    addToCart: () {
                      controller.addToCard(controller.products[index]);
                    },
                  )),
              separatorBuilder: (context, index) => SizedBox(
                    width: 5.w,
                  ),
              itemCount: controller.products.length),
        ));
  }

  Widget _buildCategoriesList() {
    return Obx(() => SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                CategoryWidget(controller.categories[index]),
            separatorBuilder: (context, index) => SizedBox(
              width: 1.w,
            ),
            itemCount: controller.categories.length,
          ),
        ));
  }

  Widget _buildAddressList() {
    return Obx(() => SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                AddressWidget(controller.addresses[index]),
            separatorBuilder: (context, index) => SizedBox(
              width: 5.w,
            ),
            itemCount: controller.addresses.length,
          ),
        ));
  }
}
