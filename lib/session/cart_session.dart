import 'package:flutter_task/models/product_model.dart';
import 'package:get/get.dart';

class CartSessionController extends GetxController {
  late RxList<ProductModel> basketProductsList = <ProductModel>[].obs;
  final RxDouble totalBasketPrice = 0.0.obs;
  final RxInt totalSelectedQuantity = 0.obs;
  static CartSessionController get get => Get.find();

  void getTotalBasketPrice() {
    totalBasketPrice.value = 0;
    for (var element in basketProductsList) {
      totalBasketPrice.value =
          totalBasketPrice.value + (element.price * element.quantity);
    }
  }

  void addToBasket(ProductModel productModel) {
    if (basketProductsList.isEmpty) {
      productModel.quantity = 1;
      basketProductsList.add(productModel);
    } else {
      ProductModel? tempProduct;
      int? updatedIndex;
      for (final element in basketProductsList) {
        final mIndex = basketProductsList.indexOf(element);
        if (productModel.id == element.id) {
          updatedIndex = mIndex;
          tempProduct = productModel;
          break;
        }
      }
      if (tempProduct != null && updatedIndex != null) {
        tempProduct.quantity++;
        basketProductsList[updatedIndex] = tempProduct;
      } else {
        productModel.quantity = 1;
        basketProductsList.add(productModel);
      }
    }
    getTotalBasketPrice();
  }
}
