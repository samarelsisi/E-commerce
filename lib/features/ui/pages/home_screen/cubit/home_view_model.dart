import 'package:bloc/bloc.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/cubit/home_states.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';

class HomeViewModel  extends Cubit<HomeStates>{
HomeViewModel():super(HomeInitState());
int selectedIndex = 0;
List<Widget> bodyList = [
  HomeTab(),
  ProductsTab(),
  FavoriteTab(),
  const UserTab()
];
void bottomNavOnTap(int index) {
  selectedIndex = index;
  emit(ChangeSelectedIndex());
}
}