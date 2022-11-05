import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/ui/cart/cart_item_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel productModel;
  final void Function(int quantity)? onQuantityChanged;
  late CartItemController controller;
  CartItemWidget(this.productModel, {this.onQuantityChanged, super.key});

  @override
  Widget build(BuildContext context) {
    controller = CartItemController(initQuantity: productModel.quantity);
    return Row(
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(productModel.image),
                fit: BoxFit.fill,
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(productModel.volume),
              SizedBox(
                height: 2.h,
              ),
              Obx(() => Text(
                    "\$${productModel.price * controller.quantity.value}",
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  )),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                controller.subQuantity();
                onQuantityChanged!(controller.quantity.value);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.remove,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Obx(() => Text(controller.quantity.value.toString())),
            SizedBox(
              width: 5.w,
            ),
            InkWell(
              onTap: () {
                controller.addQuantity();
                onQuantityChanged!(controller.quantity.value);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
