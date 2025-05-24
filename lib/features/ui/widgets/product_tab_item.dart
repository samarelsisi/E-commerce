import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/cubit/wishListStates.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/cubit/wishListViewModel.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_states.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_txt.dart';

class ProductTabItem extends StatelessWidget {
  final ProductEntity product;
  const ProductTabItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductStates>(
      listenWhen: (previous, current) =>
      current is AddToCartSuccessState || current is AddToCartErrorState,
      listener: (context, state) {
        Fluttertoast.cancel(); // Cancel previous toast before showing new one
        if (state is AddToCartSuccessState) {
          Fluttertoast.showToast(
            msg: "Added Successfully",
            backgroundColor: AppColors.greenColor,
            toastLength: Toast.LENGTH_SHORT,
          );
        } else if (state is AddToCartErrorState) {
          Fluttertoast.showToast(
            msg: state.errorMessage.errorMsg,
            backgroundColor: AppColors.redColor,
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<Wishlistviewmodel,Wishliststates>(
          listenWhen: (previous, current) => current is WishListSuccessStates|| current is WishListErrorState,
          listener: (context, state) {
            Fluttertoast.cancel();
            if (state is WishListSuccessStates) {
              Fluttertoast.showToast(
                msg: "Added to favorites",
                backgroundColor: AppColors.greenColor,
              );
            } else if (state is WishListErrorState
            ) {
              Fluttertoast.showToast(
                msg: state.errorMessage.errorMsg,
                backgroundColor: AppColors.redColor,
              );
            }
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.primary30Opacity, width: 2)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: CachedNetworkImage(
                          width: 191.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                          imageUrl: product.imageCover ?? "",
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryDark,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: AppColors.redColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.h,
                        right: 8.w,
                        child: CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 20.r,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Wishlistviewmodel.get(context).addToWishList(product.id!);
                              },
                              color: AppColors.primaryColor,
                              padding: EdgeInsets.zero,
                              iconSize: 30.r,

                              icon:  const Icon(

                                Icons.favorite_border_rounded,
                                color: AppColors.primaryColor,
                              )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTxt(
                          text: product.title ?? "",
                          fontSize: 12.sp,
                        ),
                        SizedBox(height: 2.h),
                        CustomTxt(
                          text: product.description ?? "",
                          fontSize: 12.sp,
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            CustomTxt(
                              text: product.price?.toString() ?? "",
                            ),
                            SizedBox(width: 8.w),
                            CustomTxt(
                              text: "EGP 2000",
                              textStyle: AppStyles.regular11SalePrice.copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            CustomTxt(
                              text: product.ratingsAverage.toString(),
                              fontSize: 12.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                              size: 25.sp,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                ProductViewModel.get(context)
                                    .addToCart(product.id!);
                              },
                              splashColor: Colors.transparent,
                              child: Icon(
                                Icons.add_circle,
                                size: 32.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },

        );
      },
    );
  }
}
