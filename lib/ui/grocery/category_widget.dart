import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryWidget(this.categoryModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(
                    categoryModel.categoryImage,
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(categoryModel.categoryName,
              maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
