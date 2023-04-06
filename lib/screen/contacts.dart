

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../contactModel.dart';
import 'addcontact.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

List<ContactModal> contact = [
  ContactModal(name: "Annie",number: "9898787897",img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMVQfIUSq2Zxter-cgAL8HqDI4H5WEX_EMcw&usqp=CAU"),
  ContactModal(name: "Annie Roberts",number: "9313977271",img: "https://besttoys4toddlers.com/wp-content/uploads/2020/02/25-simple-acts-of-kindness-for-toddlers-and-preschoolers.jpg"),
  ContactModal(name: "Antony Joe",number: "9904177670",img: "https://video-images.vice.com/articles/5c77d16ff260b50009c208f2/lede/1551359167925-IMG_0392.jpeg?crop=1xw:0.5966xh;0xw,0.0295xh&resize=1200:*"),
  ContactModal(name: "Arry Rose",number: "7623985418",img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAyLQ3LBVM7pszD1a6bFH2o87HmOC--mSihA&usqp=CAU"),
  ContactModal(name: "Ashley Doe",number: "9910999821",img: "https://djfromtheorphanage.files.wordpress.com/2017/10/orphanchild.jpg?w=636"),
  ContactModal(name: "Albert",number: "9898637200",img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8YzMFXf3oqGyG97t7mTwiM9a1RbSeiq2v_9JGeoFNEzTbI-4Tjs917jz438nuxIrvdmk&usqp=CAU"),
  ContactModal(name: "Joe",number: "7046632531",img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMVQfIUSq2Zxter-cgAL8HqDI4H5WEX_EMcw&usqp=CAU"),
  ContactModal(name: "Dix",number: "9825656099",img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq1EmW2gBA4WYDQBJDSAlfhSlGL_PlbCxPMB8JQTPyfUMSvMtJLye_k0szy_opdL7CGeY&usqp=CAU"),
  ContactModal(name: "Sam",number: "9033079330",img: "https://www.shemrock.com/blogs/wp-content/uploads/2016/06/charity.jpg"),
  ContactModal(name: "Dars",number: "9013151515",img: "https://media.istockphoto.com/id/1195063548/photo/cheerful-girl-receives-food-donation-while-volunteering-in-food-bank.jpg?s=612x612&w=0&k=20&c=vmndnTHuwPwRKH4RnenUqZgiEKfv8fVI7mUKcFmKkdo="),
];

  List<ContactModal> liked = [];


class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: () {

        Navigator.pushNamed(context,"addcontact").then( (value) {
          setState(() {});});

        },
        child: Icon(Icons.add,size: 25,color: Colors.white,),backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Container(alignment: Alignment.center,
                  child: Text(
                    "Contacts",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 34,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),),


                child: TextField(onTap: () {},
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search_rounded, color: Colors.black26, size: 15,),
                      hintText: "Search....",
                      hintStyle: TextStyle(fontSize: 15),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),

                    )),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(height: 100,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.blue.shade100, offset: Offset(0,
                          4), blurRadius: 5),
                    ],
                  ),

                  child: ListTile(
                    leading: Container(
                        height: 85, width: 85,
                        child: CircleAvatar(
                            radius: 40, backgroundImage: NetworkImage(
                            "https://www.mindfullittleminds.com/wp-content/uploads/2019/11/kind-kids.png"))),
                    title: Text("Eleanor Pena", style: TextStyle(color: Colors
                        .blue, fontSize: 20),),
                    subtitle: Text(
                      "My details", style: TextStyle(fontSize: 15, color: Colors
                        .black),),
                  ),

                ),
              ),

              Text("My contacts", style: TextStyle(fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: contact.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,"goprofile", arguments: index).then((value) {

                          setState(() {});

                        });
                      },
                     child: Name(contact[index]));
                  }

                ),
              ),




            ],
          ),
        ),
      ),
    ),);
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
