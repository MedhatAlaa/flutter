import 'package:app/models/messenger_model.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0.0,
        title: Row(
          children: const
          [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/223447415_1415761902119796_6139108265882492503_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=S7yXsfvw4kwAX-e6sg2&_nc_ht=scontent.faly1-2.fna&oh=2b5cdc911486f6c7aea6cce7104b64be&oe=6182E135'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color:Colors.black,
              ),
            ),
          ],
        ),
        actions:
        [
          IconButton(
              onPressed:(){},
              icon:const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  color:Colors.white,
                  size:18.0,
                ),
              ),
          ),
          IconButton(
              onPressed:(){},
              icon:const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  color:Colors.white,
                  size:18.0,
                ),
              ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            children:
            [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children:const
                  [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                        'Search',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 110.0,
                child: ListView.separated(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index)=> buildStoryItem(data[index]),
                    separatorBuilder:(context,index)=>const SizedBox(
                      width: 20.0,
                    ) ,
                    itemCount:data.length,
                ),
              ),
             const SizedBox(
                height: 25.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index)=>buildChatItem(data[index]),
                  separatorBuilder:(context,index)=>const SizedBox(
                    height: 20.0,
                  ),
                  itemCount:data.length,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items:const
        [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
            label:'Chats',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt,
              ),
            label:'Peoples',
          ),
        ],
      ) ,
    );
  }

  Widget buildStoryItem(MessengerModel model)=> Container(
    width:60.0,
    child: Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children:
      [
        Stack(
          alignment:AlignmentDirectional.bottomEnd ,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(model.image),
            ),
            const CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.white,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 5.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
         const SizedBox(
           height: 10.0,
         ),
         Text(
          model.name,
          maxLines: 2,
          overflow:TextOverflow.ellipsis ,
        ),
      ],
    ),
  );
  Widget buildChatItem(MessengerModel model)=>Row(
    children: [
      Stack(
        alignment:AlignmentDirectional.bottomEnd ,
        children:[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(model.image),
          ),
          const CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.white,
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 5.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
             Text(
              model.name,
              maxLines: 1,
              overflow:TextOverflow.ellipsis ,
            ),
            const  SizedBox(
              height: 5.0,
            ),
            Row(
              children:
              [
                Expanded (
                  child:
                  Text(
                    model.text,
                    maxLines: 2,
                    overflow:TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration:const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,

                    ),
                  ),
                ),
                 Text(
                  model.date,
                  maxLines: 1,
                  overflow:TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
