import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/custom_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> bodyList = [
    const HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(selectedIndex),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: bodyList[selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: selectedIndex,
            onTap: bottomNavOnTap,
            iconSize: 24.sp,
            // Adjust the icon size
            items: [
              _bottomNavBarItemBuilder(
                isSelected: selectedIndex == 0,
                selectedIcon: AppAssets.selectedHomeIcon,
                unselectedIcon: AppAssets.unSelectedHomeIcon,
              ),
              _bottomNavBarItemBuilder(
                isSelected: selectedIndex == 1,
                selectedIcon: AppAssets.selectedCategoryIcon,
                unselectedIcon: AppAssets.unSelectedCategoryIcon,
              ),
              _bottomNavBarItemBuilder(
                isSelected: selectedIndex == 2,
                selectedIcon: AppAssets.selectedFavouriteIcon,
                unselectedIcon: AppAssets.unSelectedFavouriteIcon,
              ),
              _bottomNavBarItemBuilder(
                isSelected: selectedIndex == 3,
                selectedIcon: AppAssets.selectedAccountIcon,
                unselectedIcon: AppAssets.unSelectedAccountIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelected,
      required String selectedIcon,
      required String unselectedIcon}) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor:
            isSelected ? AppColors.primaryColor : AppColors.whiteColor,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 25.r,
        child: Image.asset(
          isSelected ? selectedIcon : unselectedIcon,
        ),
      ),
      label: "",
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r));
  }

  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(
                AppAssets.routeLogo,
                width: 66.w,
                height: 22.h,
              ),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          style: AppStyles.regular14Text,
                          cursorColor: AppColors.primaryColor,
                          onTap: () {
                            //todo: implement search logic
                          },
                          decoration: InputDecoration(
                              border: _buildCustomBorder(),
                              enabledBorder: _buildCustomBorder(),
                              focusedBorder: _buildCustomBorder(),
                              contentPadding: EdgeInsets.all(16.h),
                              hintStyle: AppStyles.light14SearchHint,
                              hintText: "what do you search for?",
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30.sp,
                                color: AppColors.primaryColor.withOpacity(0.75),
                              ))),
                    ),
                    const CustomAppBarBadge(count: 5)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
