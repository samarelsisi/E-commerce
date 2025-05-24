import 'package:e_commerece_online_c13/core/utils/app_colors.dart';
import 'package:e_commerece_online_c13/di/di.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_states.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../widgets/product_tab_item.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});
  ProductViewModel viewModel = getIt<ProductViewModel>();

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductStates>(

        bloc: viewModel.. getAllProducts(),
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is ProductErrorState) {
            return Center(child: Text(state.errorMessage.errorMsg));
          } else if (state is ProductSuccessState) {
            print(viewModel.productsList.length);
            return SafeArea(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h),
                  itemCount: state.responseEntity.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //todo: navigate to product details screen
                        Navigator.pushNamed(context, AppRoutes.productRoute,arguments: viewModel.productsList[index]);
                      },
                      child: ProductTabItem(product:viewModel.productsList[index] ,),
                    );
                  },
                ))
              ],
            ));
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
          }
        });
  }
}
