import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VList extends StatefulWidget {
  const VList({Key? key}) : super(key: key);

  @override
  State<VList> createState() => _VListState();
}

class _VListState extends State<VList> {
  List<Color> colorr=[
   Color( 0xFF311B92),
    Color(0xFF512DA8),
    Color(0xFF7E57C2),
    Color(0xFFD1C4E9),
    Color( 0xFF311B92),
    Color(0xFF512DA8),
    Color(0xFF7E57C2),
    Color(0xFFD1C4E9),
    Color( 0xFF311B92),
    Color(0xFF512DA8),
    Color(0xFF7E57C2),
    Color(0xFFD1C4E9),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 6),
          title: Text("Valid users".toUpperCase(), style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
          actions: [Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.more_vert_rounded),
          )
          ]),
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection('farm').snapshots(),
        builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot>snapshot){
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    ListTile(
                      tileColor:colorr[index] ,
                      leading:CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person.png'),
                      ) ,
                        title: Text('${snapshot.data?.docs[index]['name']}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 20)),
                         subtitle: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 7),
                           child: Text('${snapshot.data?.docs[index]['age']}'+"/"+"${snapshot.data?.docs[index]['income']}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 15)),
                         ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white24,),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
