import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/ui/grocery/product_controller.dart';
import 'package:get/get.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel productModel;
  final void Function()? addToCart;
  final void Function(bool isFavorite)? favoriteChanged;

  const ProductWidget(this.productModel,
      {this.addToCart, this.favoriteChanged, super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductController(favorite: widget.productModel.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.productModel.image),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: -5,
                left: -5,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Colors.white),
                  child: Obx(() => IconButton(
                        splashRadius: 5.r,
                        onPressed: () {
                          controller.changeFavorite();
                          widget.favoriteChanged!(controller.isFavorite.value);
                        },
                        icon: Icon(
                          controller.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: controller.isFavorite.value
                              ? Colors.red
                              : Colors.grey,
                        ),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.productModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.productModel.volume,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text("15 Minutes ago"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.productModel.price}",
                      style: const TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "\$${widget.productModel.oldPrice}",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: widget.addToCart,
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
            ),
          ),
        ],
      ),
    );
  }
}
