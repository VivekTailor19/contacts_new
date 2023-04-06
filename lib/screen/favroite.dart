import 'dart:io';

import 'package:contact_app/screen/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/screen/contacts.dart';

import '../contactModel.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Container(alignment: Alignment.center,
              child: Text(
                "Favorites",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Name(favorites[index]);
            },
              itemCount: favorites.length,
            ),
          )






        ],
      )),
    );
  }

  Widget Name(ContactModal c)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80,width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.blue.shade100,blurRadius: 2,offset: Offset(0, 3)),]
        ),
        child: ListTile(
            leading: c.img == null ?
            CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3445/3445053.png")) :
            CircleAvatar(
              radius: 35,
              backgroundImage: FileImage( File("${c.img}")),
            ),
            title: Text("${c.name}",style: TextStyle(fontSize: 20,color: Colors.blue),),
            trailing: c.fav == true ? Icon(Icons.star_rounded,size: 20,color: Colors.blue ): Text("")
        ),
      ),
    );
  }

}

