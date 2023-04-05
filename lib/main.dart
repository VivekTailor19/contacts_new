import 'package:contact_app/screen/addcontact.dart';
import 'package:contact_app/screen/contacts.dart';
import 'package:contact_app/screen/favroite.dart';
import 'package:contact_app/screen/homescreen.dart';
import 'package:contact_app/screen/view_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => HomeScreen(),
        "goprofile":(context) => ViewProfile(),
        "contact": (context) => Contacts(),
        "addcontact":(context) => AddContact(),
        "fav":(context) => Favorites(),


      },
    ),
  );
}






// sticker    solve dependence error


// add contact and edit contact same name for textediting controller error occurss




















/*
        Spacer(),
        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
            children:
        [

                Icon(Icons.grid_view_rounded,size: 30,color: Colors.black12),
                Icon(Icons.star_rounded,size: 30,color: Colors.black12),
                Icon(Icons.watch_later,size: 30,color: Colors.blue),
                Icon(Icons.person,size: 30,color: Colors.black12),

        ],)


*/