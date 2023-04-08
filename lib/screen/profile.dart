import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        body: Center(child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Container(alignment: Alignment.center,
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 60),

            Stack(
              alignment: Alignment(0,-1.6),
              children: [
                Container(height: 390,

                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),

                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 175),
                    Text("Eleanor Pena",style: TextStyle(fontSize: 45,color: Colors.blue.shade500,wordSpacing: 4,fontStyle: FontStyle.italic),),
                    SizedBox(height: 15),
                    Text("Pro Flutter Developer",style: TextStyle(wordSpacing: 2,color: Colors.pink.shade700,fontSize: 30),),
                    SizedBox(height: 38),


                    Padding(
                      padding:  EdgeInsets.all( 8.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone :  +91 9898989898",style: TextStyle(fontSize: 18,color: Colors.green.shade700),),
                          SizedBox(height: 10),
                          Text("Email :  elean01flutter@gmail.com",style: TextStyle(fontSize: 18,color: Colors.green.shade700),),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
                Container(height: 200,width: 200,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                //     boxShadow: [
                //   BoxShadow(color: Colors.red.shade200,offset: Offset(-4, 5),blurRadius: 6),
                //   BoxShadow(color: Colors.amber.shade200,offset: Offset(4, -5),blurRadius: 6),
                // ],
                    image: DecorationImage(image: NetworkImage("https://www.mindfullittleminds.com/wp-content/uploads/2019/11/kind-kids.png"),fit: BoxFit.fill)),),]
            )

          ],
        )),


      ),
    );
  }
}
