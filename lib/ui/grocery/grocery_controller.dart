import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_task/models/address_model.dart';
import 'package:flutter_task/models/category_model.dart';
import 'package:flutter_task/session/cart_session.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class GroceryController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<AddressModel> addresses = <AddressModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  CartSessionController cartSessionController =
      Get.find<CartSessionController>();

  void getDealsProducts() async {
    final String response =
        await rootBundle.loadString("assets/json/products.json");
    var data = json.decode(response);
    if (data is List<dynamic>) {
      for (var element in data) {
        products.add(ProductModel.fromJson(element));
      }
    }
  }

  void getAddresses() async {
    final String response =
        await rootBundle.loadString("assets/json/addresses.json");
    var data = json.decode(response);
    if (data is List<dynamic>) {
      for (var element in data) {
        addresses.add(AddressModel.fromJson(element));
      }
    }
  }

  void getCategories() async {
    final String response =
        await rootBundle.loadString("assets/json/categories.json");
    var data = json.decode(response);
    if (data is List<dynamic>) {
      for (var element in data) {
        categories.add(CategoryModel.fromJson(element));
      }
    }
  }

  void addToCard(ProductModel product) {
    cartSessionController.addToBasket(product);
  }

  @override
  void onInit() {
    super.onInit();
    getDealsProducts();
    getAddresses();
    getCategories();
  }
}
