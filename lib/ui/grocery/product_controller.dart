import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isFavorite = false.obs;

  ProductController({bool? favorite}) {
    isFavorite.value = favorite ?? false;
  }

  void changeFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
