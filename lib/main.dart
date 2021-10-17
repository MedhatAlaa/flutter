import 'package:app/layout/news_app/cubit/cubit.dart';
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/layout/news_app/news_layout.dart';
import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/network/local/cache_helper.dart';
import 'package:app/shared/network/remote/dio/dio_helper.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
 bool? isDark=CacheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark!));
}
class MyApp extends StatelessWidget
{
 final bool isDark;
 MyApp(this.isDark);
  @override
  Widget build(BuildContext context)
  {
    return  MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) =>AppCubit()..changeAppMode(
          fromShard: isDark,
        ),
        ),
        BlocProvider(
          create: (BuildContext context)=>
          NewsCubit()..getBusiness()..getSports()..getScience(),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:ThemeData(
              scaffoldBackgroundColor:Colors.white,
              primarySwatch: Colors.deepOrange,
              appBarTheme:const AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                titleSpacing: 20.0,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),
                iconTheme:IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed,
              ),
              textTheme:const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme:ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme:AppBarTheme(
                color: HexColor('333739'),
                elevation: 0.0,
                titleSpacing: 20.0,
                actionsIconTheme:const IconThemeData(
                  color: Colors.white,
                ),
                iconTheme:const IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle:const TextStyle(
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey,
              ),
              textTheme:const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode:AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:const NewsLayout(),
          );
        },
      ),
    );
  }

}

