import 'dart:io';

import 'package:contact_app/screen/view_profile.dart';
import 'package:flutter/material.dart';

import '../contactModel.dart';

class Recents extends StatefulWidget {
  const Recents({Key? key}) : super(key: key);

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Container(alignment: Alignment.center,
              child: Text(
                "Recents",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Name(recents[index]);

          },
            itemCount: recents.length,
          ))





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
            title: Text("${c.name}",style: TextStyle(fontSize: 20,color: Colors.blue),),
            subtitle: Text("    📲  Mobile on Sunday",style: TextStyle(fontSize: 14),),
            trailing: Icon(Icons.call,size: 20,color: Colors.black38)
        ),
      ),
    );
  }

}
