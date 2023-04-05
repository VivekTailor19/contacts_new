

import 'package:contact_app/contactModel.dart';
import 'package:contact_app/screen/contacts.dart';
import 'package:contact_app/screen/favroite.dart';
import 'package:contact_app/screen/recents.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: i,type: BottomNavigationBarType.shifting,

          onTap: (value) {
            setState(() {
              i=value;
             });
           },

            items: [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded,size: 30),label: "",activeIcon: Icon(Icons.grid_view_rounded,size: 30,)),
          BottomNavigationBarItem(icon: Icon(Icons.star_rounded,size: 30),label: "",activeIcon: Icon(Icons.star,size: 30,)),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later,size: 30),label: "",activeIcon: Icon(Icons.watch_later,size: 30,)),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 30),label: "",activeIcon: Icon(Icons.person,size: 30,)),
        ],

            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black12,

         ),


        body: IndexedStack(
          index: i,
          children: [
            Contacts(),
            Favorites(),
            Recents(),
            Profile(),
          ],
         )
      ),
    );
  }





}


