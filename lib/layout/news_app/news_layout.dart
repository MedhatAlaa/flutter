import 'package:app/layout/news_app/cubit/cubit.dart';
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/moduels/news_app/search/search_screen.dart';
import 'package:app/shared/componants/componants.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/network/remote/dio/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text(
              'News App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            actions:
            [
              IconButton(
                onPressed:()
                {
                  navigateTo(context, SearchScreen());
                },
                icon:const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed:()
                {
                  AppCubit.get(context).changeAppMode();
                },
                icon:const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavItem(index);
            },
            items:cubit.items,
          ),
        );
      },
    );
  }
}
