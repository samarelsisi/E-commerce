import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/cubit/wishListStates.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/cubit/wishListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../widgets/favorite_item.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Wishlistviewmodel.get(context).getWishListItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<Wishlistviewmodel, Wishliststates>(
          builder: (context, state) {
            if (state is GetWishListSuccessStates) {
              final wishList = Wishlistviewmodel.get(context).wishListItemsList;
              return Expanded(
                child: ListView.builder(
                  itemCount: wishList.length,
                  itemBuilder: (context, index) => FavoriteItem(
                    product: wishList[index],
                  ),
                ),
              );
            } else if (state is WishListErrorState) {
              return Center(child: Text(state.errorMessage.errorMsg));
            } else {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.redColor),
              );
            }
          },
        ),
      ],
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50.r),
    );
  }
}
