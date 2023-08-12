import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:veggiez/style/colors.dart';
import 'package:veggiez/style/icon_broken.dart';
import 'app_cubit/cubit.dart';
import 'app_cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Scaffold(
            appBar: AppBar(
              title: cubit.currentIndex == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text('Esraa',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700)),
                      ],
                    )
                  : null,
              actions: [
                IconButton(
                  icon: Icon(
                    IconBroken.Search,
                  ),
                  onPressed: () {
                    //  navigateTo(context, SearchScreen(),);
                  },
                ),
                if (cubit.currentIndex == 0)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconBroken.Notification),
                  ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 5.0,
              ),
              child: Column(
                children: [
                  if (cubit.currentIndex == 0)
                    Row(
                      children: [
                        Icon(
                          IconBroken.Location,
                          color: defaultColor,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Egypt, Minya',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  cubit.appScreens[cubit.currentIndex],
                ],
              ),
            ),
            extendBody: true,
            bottomNavigationBar: DotNavigationBar(
              //paddingR: EdgeInsets.symmetric(horizontal: 30,vertical: 16,),
              backgroundColor: secondColor,
              selectedItemColor: defaultColor,
              unselectedItemColor: unSelectedItemColor,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBarIndex(index);
              },
              borderRadius: 39,
              items: [
                DotNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                ),
                DotNavigationBarItem(
                  icon: Icon(
                    IconBroken.Bag,
                  ),
                  selectedColor: defaultColor,
                  unselectedColor: unSelectedItemColor,
                ),
                DotNavigationBarItem(
                  icon: Icon(
                    IconBroken.Heart,
                  ),
                  selectedColor: defaultColor,
                  unselectedColor: unSelectedItemColor,
                ),
                DotNavigationBarItem(
                  icon: Icon(
                    IconBroken.Profile,
                  ),
                  selectedColor: defaultColor,
                  unselectedColor: unSelectedItemColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
