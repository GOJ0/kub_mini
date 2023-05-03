
import 'package:flutter/material.dart';


// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 6),
          title: Text("Profile".toUpperCase(), style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
          actions: [Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.more_vert_rounded),
          )
          ]),
      body: Column(
        children: [
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/person.png'),

                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("   RITIK AGGARWAL", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 20),),
          ),
          Text("Senior Executive", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 12),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            child: Text("An Office Administrator is a professional who oversees operations across their organization’s office. They are responsible for welcoming visitors, coordinating meetings, appointments and directing various administrative projects. ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 12),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            child: Text("Coordinate office activities and operations to secure efficiency and compliance to company policies Supervise administrative staff and divide responsibilities to ensure performanceManage agendas/travel arrangements/appointments etc. for the upper managementManage phone calls and correspondence (e-mail, letters, packages etc.)Support budgeting and bookkeeping proceduresCreate and update records and databases with personnel, financial and other dataTrack stocks of office supplies and place orders when necessary ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 12),),
          ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: SizedBox(
                width: 320,
                child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ]
                    )
                ),
                child: Center(
                  child: Text("MORE DETAILS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
          ),
              ),
            ),
        ],
      ),
    );
  }
}
