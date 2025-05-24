import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_states.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';

class CustomAppBarBadge extends StatelessWidget {


  const CustomAppBarBadge({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return InkWell(
      onTap: currentRoute != AppRoutes.cartRoute
          ? () {
              Navigator.of(context).pushNamed(AppRoutes.cartRoute);
            }
          : null,
      child: BlocBuilder<ProductViewModel,ProductStates>(
     builder: (context, state) {
       return  Badge(
         alignment: AlignmentDirectional.topStart,
         backgroundColor: AppColors.greenColor,
         label:Text(ProductViewModel.get(context).numOfCartItem.toString())
         ,
         child: ImageIcon(
           const AssetImage(AppAssets.shoppingCart),
           size: 35.sp,
           color: AppColors.primaryColor,
         ),
       );
     },
      ),
    );
  }
}
