import 'package:e_commerece_online_c13/di/di.dart';
import 'package:e_commerece_online_c13/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerece_online_c13/features/ui/pages/cart_screen/cubit/get_Cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../widgets/cart_item.dart';
import '../../widgets/custom_badge.dart';
import '../../widgets/custom_txt.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "CartItems";
  // CartViewModel viewModel = getIt<CartViewModel>();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _customAppBar(context),
        body: BlocBuilder<CartViewModel,CartStates>(
          bloc: CartViewModel.get(context) ..getItemInCart(),
          builder: (context, state) {
            if(state is GetCartSuccessState){
              return  Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                        itemCount: state.responesEntity.data!.products!.length,
                        itemBuilder: (context, index) {
                          return  CartItem(product: state.responesEntity.data!.products![index],);
                        },
                      )),
                  _buildCheckOut(context, state.responesEntity.data!.totalCartPrice!.toDouble()),
                ],
              );
            }
            else if(state is GetCartErrorStates){
              return Text(state.errorMessage.errorMsg);
            }
            else{
              return const Center(child: CircularProgressIndicator(color: AppColors.redColor,),);
            }
          },

        ));
  }


}

Widget _buildCheckOut(BuildContext context, double price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w),
    child: Row(
      children: [
        Column(
          children: [
            const CustomTxt(text: "Total Price"),
            CustomTxt(text: "$price", fontWeight: FontWeight.bold),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                onPressed: () {
                  //todo: navigate to payment section
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomTxt(
                        text: "Check Out", fontColor: AppColors.whiteColor),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.whiteColor,
                      size: 28.sp,
                    ),
                  ],
                )))
      ],
    ),
  );
}

PreferredSizeWidget _customAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    toolbarHeight: 50.h,
    centerTitle: true,
    elevation: 0,
    title: const Text("Cart"),
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.primaryColor,
    titleTextStyle: Theme
        .of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(
          Icons.search_outlined,
          size: 35.sp,
          color: AppColors.primaryColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: CustomAppBarBadge(),
      ),
    ],
  );
}
