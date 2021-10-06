import 'package:app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text(
            'Users',
        ),
      ),
      body:ListView.separated(
        physics:const BouncingScrollPhysics(),
          itemBuilder:(context,index)=>buildUserItem(users[index]),
          separatorBuilder:(context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 50.0,
              end: 50.0,
            ),
            child: Container(
              height: 1.0,
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          itemCount: users.length,
      ) ,
    );
  }

  Widget buildUserItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
         CircleAvatar(
          radius: 25.0,
          child: Text(
           user.id,
            style:const TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                user.name,
                style:const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const  SizedBox(
                height: 10.0,
              ),
              Text(
                user.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
