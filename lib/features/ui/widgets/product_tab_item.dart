import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_txt.dart';

class ProductTabItem extends StatelessWidget {
  const ProductTabItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                  imageUrl:
                      "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw42ccc9ea/nk/a9b/7/6/4/b/1/a9b764b1_834c_413e_aec2_f460112b2de6.jpg?sw=2000&sh=2000&sm=fit",
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
                            // todo add to favorite
                          },
                          color: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          iconSize: 30.r,
                          // Adjust icon size as needed
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            color: AppColors.primaryColor,
                          )),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  text: "Nike Air Jordan",
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxt(
                  text: "NIKE SHOES FLEXIBLE FOR MEN",
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(children: [
                  const CustomTxt(
                    text: "EGP 1500",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomTxt(
                    text: "EGP 2000",
                    textStyle: AppStyles.regular11SalePrice
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ]),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    CustomTxt(
                      text: "Review (4.8)",
                      fontSize: 12.sp,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 25.sp,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
