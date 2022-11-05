import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/session/cart_session.dart';
import 'package:flutter_task/ui/cart/cart_screen.dart';
import 'package:flutter_task/ui/grocery/grocery_screen.dart';
import 'package:flutter_task/ui/home/home_layout_controller.dart';
import 'package:get/get.dart';

class HomeLayout extends GetView<HomeLayoutController> {
  HomeLayout({super.key});
  final cartSession = Get.find<CartSessionController>();
  List<Widget> screens = [
    GroceryScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "\$${cartSession.totalBasketPrice.obs}",
                  style: TextStyle(
                    fontSize: 5.sp,
                  ),
                )),
            Icon(
              Icons.shopping_cart_outlined,
              size: 10.sp,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            showUnselectedLabels: true,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: "grocery",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none_outlined),
                label: "News",
              ),
              BottomNavigationBarItem(icon: SizedBox(), label: ""),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet),
                label: "Cart",
              ),
            ],
          )),
    );
  }
}
