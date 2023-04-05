import 'dart:io';

import 'package:contact_app/contactModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'contacts.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}



class _AddContactState extends State<AddContact> {

  TextEditingController addname = TextEditingController();
  TextEditingController addno = TextEditingController();
  String? path;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      photoalert();
                      },
                    child: Container(height: 150,width: 150,alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.lightBlue.shade100,
                        image: path == null ?
                        DecorationImage(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3445/3445053.png"),fit: BoxFit.cover) :
                        DecorationImage(image: FileImage(File("$path")),fit: BoxFit.cover))
                    ),
                  ),

                  SizedBox(height: 25),
                  TextField(controller: addname,
                    style: TextStyle(fontSize: 30,color: Colors.blue.shade600),
                    keyboardType: TextInputType.name
                    ,
                    decoration: InputDecoration(
                      labelText: "Enter Name",
                      labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                      filled: true,
                      fillColor: Colors.lightBlue.shade50,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),

                    ),),
                  SizedBox(height: 25),

                  TextField(controller: addno,
                    style: TextStyle(fontSize: 30,color: Colors.blue.shade600),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Contact",
                      labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                      filled: true,
                      fillColor: Colors.lightBlue.shade50,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),

                    ),),
                  SizedBox(height: 45),
                  ElevatedButton(onPressed: () {

                    ContactModal adCont = ContactModal(name: addname.text,number: addno.text,img: path);


                    setState(() {
                      contact.add(adCont);
                    });

                    Navigator.pop(context);

                  },  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: Text("Create",style: TextStyle(color: Colors.pinkAccent,fontSize: 35),))
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }

  void photoalert()
  {
    showDialog(context: context, builder: (context) {
      return AlertDialog(backgroundColor: Colors.blueGrey.shade50,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 20),
                Text("Add Photo",style: TextStyle(fontSize: 35)),
                SizedBox(height: 40),
                TextButton(onPressed: () async {
                  ImagePicker ip = ImagePicker();
                  XFile? xfile = await ip.pickImage(source: ImageSource.camera);

                  setState(() {
                    path = xfile?.path;
                  });
                   },
                  child: Text("Take Photo",style: TextStyle(fontSize: 20),),),

                SizedBox(height: 30),
                TextButton(onPressed: () async {
                  ImagePicker ip = ImagePicker();
                  XFile? xfile = await ip.pickImage(source: ImageSource.gallery);

                  setState(() {
                    path = xfile?.path;
                  });
                },
                    child: Text("Choose Photo",style: TextStyle(fontSize: 20),)),
                SizedBox(height: 40),
                Align(alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {Navigator.pop(context);},
                    child: Text("Cancel",style: TextStyle(fontSize: 15,color: Colors.red),)),)

          ]),
        ),
      );
    },);
  }
}
