
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/moduels/news_app/business/business_screen.dart';
import 'package:app/moduels/news_app/science/science_screen.dart';
import 'package:app/moduels/news_app/sports/sports_screen.dart';
import 'package:app/shared/network/remote/dio/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  List<BottomNavigationBarItem>items=const
  [
    BottomNavigationBarItem(
        icon:Icon(
          Icons.business,
        ),
      label: 'business',
    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.sports_baseball_sharp,
        ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.science,
        ),
      label: 'science',
    ),
  ];
  List<Widget>screens=const
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeBottomNavItem(index)
  {
    currentIndex=index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic>business=[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'dd8745ec8f2a46cbb9256997ffb9268d',
      },
    ).then((value)
    {
      business=value.data['articles'] ;
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print('error is business=> ${error.toString()}');
      emit(NewsGetBusinessErrorState());
    });
  }

  List<dynamic>sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':'dd8745ec8f2a46cbb9256997ffb9268d',
      },
    ).then((value)
    {
      sports=value.data['articles'] ;
      emit(NewsGetSportsSuccessState());
    }).catchError((error)
    {
      print('error is sports=> ${error.toString()}');
      emit(NewsGetSportsErrorState());
    });
  }

  List<dynamic>science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':'dd8745ec8f2a46cbb9256997ffb9268d',
      },
    ).then((value)
    {
      science=value.data['articles'] ;
      emit(NewsGetScienceSuccessState());
    }).catchError((error)
    {
      print('error is science=> ${error.toString()}');
      emit(NewsGetScienceErrorState());
    });
  }

  List<dynamic>search=[];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url:'v2/everything',
      query:
      {
        'q':value,
        'apiKey':'dd8745ec8f2a46cbb9256997ffb9268d',
      },
    ).then((value)
    {
      search=value.data['articles'] ;
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      print('error is search=> ${error.toString()}');
      emit(NewsGetSearchErrorState());
    });
  }
}
