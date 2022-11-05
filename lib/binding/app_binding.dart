import 'package:flutter_task/session/cart_session.dart';
import 'package:flutter_task/ui/grocery/grocery_controller.dart';
import 'package:flutter_task/ui/grocery/product_controller.dart';
import 'package:flutter_task/ui/home/home_layout_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartSessionController(), permanent: true);
    Get.put(HomeLayoutController());
    Get.put(GroceryController());
    Get.put(ProductController());
  }
}
