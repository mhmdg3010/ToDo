
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users =
  [
    UserModel(
        id: 1, name: 'Ahmed Ali', phone: '01090281398'),
    UserModel(
        id: 2, name: 'Ahmed atef', phone: '012773838484'),
    UserModel(
        id: 3, name: 'walid Ali', phone: '043633637'),
    UserModel(
        id: 4, name: 'Mohamed Ali', phone: '01090281398'),
    UserModel(
        id: 5, name: 'Ahmed Ali', phone: '01090281398'),
    UserModel(
        id: 6, name: 'Ahmed Ali', phone: '01090281398'),
    UserModel(
        id: 7, name: 'Ahmed Ali', phone: '01090281398'),
    UserModel(
        id: 8, name: 'Ahmed atef', phone: '012773838484'),
    UserModel(
        id: 9, name: 'walid Ali', phone: '043633637'),
    UserModel(
        id: 10, name: 'Mohamed Ali', phone: '01090281398'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) =>buildItem(users[index]),
          separatorBuilder: (context,index)=> Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          itemCount: users.length)

    );
  }
}

Widget buildItem(UserModel user) =>Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 30,
        child: Text('${user.id}',
          style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      SizedBox(
        width: 20,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${user.name}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          Text('${user.phone}',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),),

        ],
      ),

    ],
  ),
);

class UserModel{
  final int id;
  final String name;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
});
}
