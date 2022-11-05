import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/ui/cart/cart_item_widget.dart';
import 'package:flutter_task/widgets/top_screen_widget.dart';
import 'package:get/get.dart';

import '../../session/cart_session.dart';

class CartScreen extends StatelessWidget {
  final cartSession = Get.find<CartSessionController>();
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopScreenWidget(),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CartItemWidget(
                    cartSession.basketProductsList[index],
                    onQuantityChanged: (quantity) {
                      cartSession.basketProductsList[index].quantity = quantity;
                      cartSession.getTotalBasketPrice();
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: cartSession.basketProductsList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
