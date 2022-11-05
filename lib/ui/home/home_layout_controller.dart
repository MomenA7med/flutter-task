import 'package:flutter_task/session/cart_session.dart';
import 'package:get/get.dart';

class HomeLayoutController extends GetxController {
  RxInt currentIndex = 0.obs;
  final cartSession = Get.find<CartSessionController>();

  void changeIndex(int index) {
    if (index != 2) {
      currentIndex.value = index;
    }
  }

  @override
  void onInit() async {
    cartSession.getTotalBasketPrice();
    super.onInit();
  }
}
