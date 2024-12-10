import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.v0pUXPj0NYJBrruMACbl6AAAAA?rs=1&pid=ImgDetMain'),

              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white54,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white54,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                      ))),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        color: Colors.grey[400],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Search',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      itemBuilder: (index ,context) => buildStoryItem(),
                      separatorBuilder: (index,context)=> SizedBox(width: 5,),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(

                    height:900,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemBuilder: (context, index)=>buildChatItem(),
                        separatorBuilder: (context, index)=> SizedBox( height: 10,),
                        itemCount: 25),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget buildChatItem() =>  Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(radius: 30,
        backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.v0pUXPj0NYJBrruMACbl6AAAAA?rs=1&pid=ImgDetMain'),
        ),
        CircleAvatar(
          radius: 8,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: 7,
          backgroundColor: Colors.red,
        ),
      ],
    ),
    SizedBox(
      width: 10,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mohammed Nasser',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hello my name is mohammed nasser ahmed hassan',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 8,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                '02:00 PM',
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
Widget buildStoryItem() => Container(
  width: 60,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(radius: 30,
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.v0pUXPj0NYJBrruMACbl6AAAAA?rs=1&pid=ImgDetMain'),
          ),
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      Text(
        'Mohamed Nasser Ahmed',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  ),
);

