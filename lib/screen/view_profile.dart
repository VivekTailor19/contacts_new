import 'dart:io';

import 'package:contact_app/contactModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


import 'contacts.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

List<ContactModal> favorites = [];
List<ContactModal> recents = [];

class _ViewProfileState extends State<ViewProfile> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  String? path;


  @override
  Widget build(BuildContext context) {

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(

            children: [

              ListTile(
                leading: GestureDetector(onTap: ()
                    {
                      Navigator.pop(context);
                      },
                    child: Icon(Icons.arrow_back_ios,color: Colors.blue,size: 25,)),
                title: Text("Contacts",style:GoogleFonts.arefRuqaa(color: Colors.blue,fontSize: 25),),
                trailing: GestureDetector(
                    onTap: () {
                      alertedit(index);


                       },
                    child: Icon(Icons.edit_square,color: Colors.blue,size: 30,)),
              ),
              SizedBox(height: 60),

              Stack(
                alignment: Alignment(0,-1.8),
                children:
                [
                  Container(height: 270,width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                    children: [
                      SizedBox(height: 75),
                      Text("${contact[index].name}",style: GoogleFonts.poppins(fontSize: 30,color: Colors.blue),),
                      SizedBox(height: 12),
                      Text("${contact[index].number}",style: GoogleFonts.poppins(fontSize: 12,color: Colors.blue),),
                      SizedBox(height: 12),
                      Text("${contact[index].name}${index}0${index}0${index}@gmail.com",style: GoogleFonts.poppins(fontSize: 11,color: Colors.blue),),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [


                            InkWell(onTap: () async {
                                Uri message = Uri(
                                  scheme: 'sms',
                                  path: '${contact[index].number}',
                                  queryParameters: {'body':' Testing : જો બકા તકલીફ તો રેહવાની જ '}
                                );
                                await launchUrl(message);
                                } ,
                                child: Tabs(Icon(Icons.message_sharp,size: 20,color: Colors.blue,))),

                            InkWell(onTap: () async {
                              String number = "tel: ${contact[index].number}";
                              await launchUrl(Uri.parse(number));

                              ContactModal temp = ContactModal(name: contact[index].name,number: contact[index].number);
                              setState(() {
                                recents.add(temp);
                              });

                                },
                             child: Tabs(Icon(Icons.call,size: 20,color: Colors.blue,))),

                            Tabs(Icon(Icons.videocam,size: 20,color: Colors.blue,)),

                            InkWell(onTap: () async {
                            Uri mail = Uri(
                                scheme: 'mailto',
                                path: 'enterEmail@gmail.com',
                                queryParameters: {'body':' Testing Email : જો બકા તકલીફ, તો રેહવાની જ '}
                            );
                            await launchUrl(mail);
                            } ,

                            child: Tabs(Icon(Icons.email,size: 20,color: Colors.blue,))),

                        ],)

                    ],
                    ),
                ),


                 contact[index].img == null ?
                 CircleAvatar(radius: 60,backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3445/3445053.png"),)
                  :
                 CircleAvatar(radius: 60,backgroundImage: FileImage(File("${contact[index].img}"),),),

                ],
              ),
              SizedBox(height: 15),
              Container(height: 110,
                width:double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: Colors.blue.shade100),
                    boxShadow: [BoxShadow(color: Colors.lightBlue.shade100,
                        offset: Offset(0, 2),blurRadius: 3)],
                ),

                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 15),
                  child: Text("Send Whatsapp Message",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18),),
                ),
                Container(height:1,width: double.infinity,color: Colors.lightBlue.shade100),

                InkWell(onTap: () {
                    Share.share("Name : ${contact[index].name}\nContact : ${contact[index].number}\nEmail : ${contact[index].name}${index}0${index}0${index}@gmail.com");
                   },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 15),
                    child: Text("Share Contact",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18)),
                  ),
                ),
                Container(height:1,width: double.infinity,color: Colors.lightBlue.shade100),

                  contact[index].fav == false ?
                  InkWell(onTap: () {

                    ContactModal temp = ContactModal(name: contact[index].name,number: contact[index].number,img: contact[index].img);
                    setState(() {
                      favorites.add(temp);

                      contact[index].fav = true ;

                    });
                  },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 15),
                      child: Text("Add to Favorites",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18)),
                    ),
                  ) :
                  InkWell(onTap: () {
                    for(int i = 0 ; i< favorites.length ; i++)
                      {
                        if(favorites[i].name == contact[index].name)
                          {
                            setState(() {
                              favorites.removeAt(i);
                            });

                          }
                      }

                   setState(() {

                     contact[index].fav = false;

                   });
                  } ,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 15),
                    child: Text("Remove to Favorites",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18)),
            ),
          )

              ],),),

              SizedBox(height: 15),
              InkWell(onTap: () {
                setState(() {
                  contact.removeAt(index);
                });
                Navigator.pop(context);
              },
                child: Container(height: 50,width: double.infinity,alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.lightBlue.shade100,offset: Offset(0,2),blurRadius: 3)],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("Delete Contact",
                        style: TextStyle(color: Colors.red,fontSize: 23,wordSpacing:3,fontFamily: 'ame',fontWeight: FontWeight.bold),),
                  ),),
              ),

              SizedBox(height: 15),
              Container(height: 50,width: double.infinity,alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.lightBlue.shade100,offset: Offset(0,2),blurRadius: 3)],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text("Block Contact",
                      style: TextStyle(color: Colors.red,fontSize: 23,wordSpacing:3,fontFamily: 'ame',fontWeight: FontWeight.bold),),
                ),),


            ],
          ),
        ),
      ),

      ),
    );
  }

  Container Tabs(Icon icon)
  {
    return Container(height: 40,width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.lightBlue.shade50,offset: Offset(0, 8),blurRadius: 8)]
      ),
      child: icon);
  }

  void alertedit(int index)
  {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                photoalert(index);
              },
              child: Container(height: 150,width: 150,alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.lightBlue.shade100,
                      image:
                      path == null ?
                      DecorationImage(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3445/3445053.png"),fit: BoxFit.cover) :
                      DecorationImage(image: FileImage(File("$path")),fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 9),
            TextField(

              controller: txtname =  TextEditingController(text: "${contact[index].name}"),
              style: TextStyle(fontSize: 30,color: Colors.blue.shade600),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Enter Name",
                labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),

              ),),
            SizedBox(height: 9),

            TextField(controller: txtnumber = TextEditingController(text: "${contact[index].number}"),

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
            SizedBox(height: 9),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent.shade100),
              child: Text("✔  Update ✔",style: TextStyle(fontSize: 25)),

              onPressed: () {

                String tname = txtname.text;
                String tno = txtnumber.text;

                setState(() {
                  contact[index] = ContactModal(name: tname, number: tno,img: path);
                });

                Navigator.pop(context);

              },
            )
          ],
        ),
      );
    },);
  }

  void photoalert(int index)
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


























//path != null ?
//ClipOval(child: Image.network("https://cdn-icons-png.flaticon.com/512/3445/3445053.png",height: 120,width: 120,fit: BoxFit.fill,),)
//:
// ClipOval(child: (File("$path"),height: 120,width: 120,fit: BoxFit.fill,),)