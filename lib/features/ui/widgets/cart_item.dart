import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:e_commerece_online_c13/features/ui/pages/cart_screen/cubit/get_Cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import 'custom_txt.dart';

class CartItem extends StatelessWidget {
  GetProductsEntity product;
   CartItem({super.key,required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo: navigate to product detail screen
        Navigator.pushNamed(context, AppRoutes.productRoute);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 145.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.primary30Opacity, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Column(
                    children: [
                      _buildItemHeader(context),
                      SizedBox(height: 5.h),
                      // _buildItemDetails(),
                      SizedBox(height: 5.h),
                      _buildItemPrice(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 130.w,
          height: 145.h,
          fit: BoxFit.cover,
          imageUrl:
          product.product!.imageCover??"",
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.redColor,
          ),
        ),
      ),
    );
  }

  Widget _buildItemHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Container(
             width:140.w,
             child: CustomTxt(text: product.product!.title??"" ,)),
        InkWell(
          onTap: () {
            print(product.product!.id);
            CartViewModel.get(context).deleteItemsInCart(product.product!.id??"");
          },
          child: Icon(
            CupertinoIcons.delete,
            color: AppColors.primaryColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemDetails() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.blackColor,
          radius: 10.r,
        ),
        SizedBox(width: 10.w),
        // CustomTxt(
        //   text: product.product.,
        //   fontColor: AppColors.blackColor.withOpacity(0.4),
        //   fontSize: 14.sp,
        // ),
      ],
    );
  }

  Widget _buildItemPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTxt(
          text: product.price.toString(),
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        _buildQuantityControl(product.count!.toInt()),
      ],
    );
  }

  Widget _buildQuantityControl(int count) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // if (itemCount > 1) {
              //   setState(() {
              //     itemCount--;
              //   });
              // }
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
          CustomTxt(
            text: count.toString(),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontColor: AppColors.whiteColor,
          ),
          IconButton(
            onPressed: () {
              // setState(() {
              //   itemCount++;
              // });
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
