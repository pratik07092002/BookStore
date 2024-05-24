
import 'package:flutter/material.dart';
import 'package:mybookapp/screens/createaccount/usermodel/usermod.dart';
import 'package:mybookapp/utils/mediaqueries.dart';

class UserProfile extends StatefulWidget {
  final UserModel userModel;
  const UserProfile({super.key, required this.userModel});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
      Stack(
        children: [
          Container(
            
            height: ScreenQuery.screenHeight(context)*0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(100, 50) , bottomLeft: Radius.elliptical(100, 50) )
            
            ,
          
            boxShadow: [
              BoxShadow(color: Colors.green , 
              blurRadius: 7 ,
              spreadRadius: 6
              )
            ],
            color: Colors.blueGrey.shade900,
            ),
            
          
          ),
         Row(

          children: [
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: ScreenQuery.screenHeight(context)*0.09,
              backgroundImage: AssetImage("assets/icons/Profile/user.jpg"),
            ),
            
          ) , 
          SizedBox(width: ScreenQuery.screenWidth(context)*0.02,),
          Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userModel.name ?? "Default Name", style: TextStyle(fontSize: ScreenQuery.screenHeight(context)*0.03 , color: Colors.blueGrey.shade100),)
            ],
          )
          ],
         )
        ],
      ),
      SizedBox(height: ScreenQuery.screenHeight(context)*0.02,),
      ListTile(title: Text("Settings" , style: TextStyle(fontSize: ScreenQuery.screenHeight(context)*0.02 , color: Colors.blueGrey),),
      onTap: () {
        
      },
      trailing: Icon(Icons.settings , color: Colors.green),
      ),
      ListTile(title: Text("Lists" , style: TextStyle(fontSize: ScreenQuery.screenHeight(context)*0.02 , color: Colors.blueGrey), ),
      onTap: () {
        
      },
      trailing: Icon(Icons.list_alt , color: Colors.green,),
      ), 
      ListTile(title: Text("Buy Again" , style: TextStyle(fontSize: ScreenQuery.screenHeight(context)*0.02 , color: Colors.blueGrey),),
      onTap: () {
        
      },
      trailing: Icon(Icons.trolley , color: Colors.green),
      ), 
      ListTile(title: Text("Address" , style: TextStyle(fontSize: ScreenQuery.screenHeight(context)*0.02 , color: Colors.blueGrey),),
      onTap: () {
        
      },
      trailing: Icon(Icons.place , color: Colors.green),
      )
    ],) );
  }
}