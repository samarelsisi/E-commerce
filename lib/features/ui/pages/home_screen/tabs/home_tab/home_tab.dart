import 'package:e_commerece_online_c13/di/di.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../widgets/category_brand_item.dart';

class HomeTab extends StatelessWidget {
   HomeTab({Key? key}) : super(key: key);
  HomeTabViewModel viewModel=getIt<HomeTabViewModel>();
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrands(),
      builder: (context, state) {
        return(  SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              _buildAnnouncement(
                images: [
                  AppAssets.announcement1,
                  AppAssets.announcement2,
                  AppAssets.announcement3,
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              _lineBreak(name: "Categories"),
              viewModel.categoryList.isEmpty?
                  const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                  :
              // Text(viewModel.categoryList.length.toString()),
               _buildCategoryBrandSec(list: viewModel.categoryList),
              _lineBreak(name: "Brands"),
              viewModel.brandsList.isEmpty?
              const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                  : _buildCategoryBrandSec(list: viewModel.brandsList),
            ],
          ),
        ));
      },

    );
  }

  SizedBox _buildCategoryBrandSec({required List<CategoryOrBrandEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 4.h, crossAxisSpacing: 8.w),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          
          return CategoryBrandItem(item: list[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
    return ImageSlideshow(
        indicatorColor: AppColors.primaryColor,
        initialPage: 0,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5,
        indicatorBackgroundColor: AppColors.whiteColor,
        isLoop: true,
        autoPlayInterval: 3000,
        height: 190.h,
        children: images.map((url) {
          return Image.asset(
            url,
            fit: BoxFit.fill,
          );
        }).toList());
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed:(){
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        )
      ],
    );
  }
}
