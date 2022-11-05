import 'package:get/get.dart';

class CartItemController extends GetxController {
  RxInt quantity = 1.obs;
  CartItemController({int? initQuantity}) {
    quantity.value = initQuantity ?? 1;
  }

  void addQuantity() {
    quantity.value++;
  }

  void subQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
