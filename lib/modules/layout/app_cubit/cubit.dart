import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/modules/cart/cart_screen.dart';
import 'package:veggiez/modules/layout/app_cubit/states.dart';
import 'package:veggiez/modules/profile/profile_screen.dart';
import 'package:veggiez/modules/saved/saved_screen.dart';

import '../../home/home_screen.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> appScreens = [
    HomeScreen(),
    CartScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  void changeNavBarIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }




}
