import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/bloc_observer.dart';
import 'package:veggiez/modules/layout/app_cubit/cubit.dart';
import 'package:veggiez/modules/layout/app_cubit/states.dart';
import 'package:veggiez/modules/layout/layout_screen.dart';
import 'package:veggiez/modules/login/login_screen.dart';
import 'package:veggiez/modules/on_boarding/on_boarding_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:veggiez/shared/network/local/cache_helper.dart';
import 'package:veggiez/style/themes.dart';

import 'modules/home/home_screen.dart';
import 'shared/componentes/constans.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  tokenID = CacheHelper.getData(key: 'token');
  if(tokenID != null)
    print('THE TOKEN ////////////'+ tokenID!);
  else print('////////////// THE TOKEN IS NULL //////////////');

  Widget widget;
  if(onBoarding != null)
  {
    if(tokenID != null) widget = HomeScreen();
    else widget = LoginScreen();
  } else
  {
    widget = OnBoardingScreen();
  }


  runApp( MyApp(startWidget: widget,),);
}


class MyApp extends StatelessWidget {

  Widget startWidget;
  MyApp({required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: ThemeMode.light,
              home: LayoutScreen(),
            );
          },
        ),
      ),
    );
  }
}


