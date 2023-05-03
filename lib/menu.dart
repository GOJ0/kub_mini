import 'package:flutter/material.dart';
import 'package:organic_farm/e-fer.dart';
import 'package:organic_farm/e_seed.dart';
import 'package:organic_farm/approved.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:organic_farm/farmer_supply.dart';
import 'package:organic_farm/help.dart';
import 'package:organic_farm/image_pick.dart';
import 'package:organic_farm/profile.dart';
import 'package:organic_farm/query_feed.dart';
import 'package:organic_farm/shopping.dart';
import 'package:organic_farm/valid_list.dart';
import 'Details.dart';
import 'chat.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _handleCommand(Map<String,dynamic> command){
    switch(command['command']){
      case  "forward":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Seed()),
        );
        break;
      case  "back":
        Navigator.pop(context);
        break;
      default:debugPrint("unknown command");
    }
  }
  _MenuState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton("e956ecee03fb5d133d2fc654dae04ccb2e956eca572e1d8b807a3e2338fdd0dc/stage",buttonAlign:AlanVoice.BUTTON_ALIGN_LEFT );

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) =>_handleCommand(command.data));
  }
  List<String> myList=[
    'assets/images/farm.png',
    'assets/images/farmer.png',
    'assets/images/chat.png',
    'assets/images/admin.png',
    'assets/images/far2.png',
    'assets/images/help.png',
    'assets/images/ques.png',
    'assets/images/gra.png',

  ];
  List<String> colo=[
  "Seeds",
    "Farmer Info",
    "Chatting",
    "Admin",
    "Fertilizers",
    "Help!",
    "Question Feeds",
    "Services"
  ];
  List<String> data=[
    "Buy Seeds",
    "Farmer Details",
    "Talk",
    "Admin Brief",
    "Buy Fertilizers",
    "Farming Details",
    "Feeds",
    "Farming Data"
  ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(143, 148, 251,6),
        title: Text("MENU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 20),),
      actions: [Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(Icons.more_vert_rounded),
      )]),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(myList.length, (index) {
          return GestureDetector(
            onTap: (){
              if(index==0){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Seed()),
                );
              }
              else if(index==2){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Messaging()),
                );
              }
              else if(index==4){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fer()),
                );
              }
              else if(index==6){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityFeed()),
                );
              }
    else if(index==5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shopping()),
                );
              }
              else if(index==3){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }
              else if(index==7){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmerSupply()),
                );
              }
              else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateJobForum()),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
            decoration: BoxDecoration(
            border: Border.all(
            color: Colors.grey,
            width: 4.0,
            style: BorderStyle.solid), //Border.all

            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            ),
            ),
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          radius:45 ,
                          backgroundImage:AssetImage(myList[index]) ,
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(colo[index].toUpperCase(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(data[index], style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 10),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }),

      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor:  Color.fromRGBO(143, 148, 251,6),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.auto_graph),
      //       label: '  Details',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.location_history),
      //       label: 'District',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.white,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
