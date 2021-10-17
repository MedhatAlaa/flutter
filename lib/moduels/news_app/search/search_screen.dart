import 'package:app/layout/news_app/cubit/cubit.dart';
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/shared/componants/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                    controller:searchController ,
                    onChanged: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },
                    decoration: InputDecoration(
                      label:const Text(
                        'search',
                      ),
                      prefixIcon:const Icon(
                        Icons.search,
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
                ),
              ),
              Expanded(
                child: buildArticleItem(list,context,isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}