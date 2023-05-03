import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Approved extends StatefulWidget {
  const Approved({Key? key}) : super(key: key);

  @override
  State<Approved> createState() => _ApprovedState();
}

class _ApprovedState extends State<Approved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('farm').snapshots(),
          builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot>snapshot){
             return ListView.builder(
                 itemCount: snapshot.data?.docs.length,
                 itemBuilder: (context,index){
               return Text('${snapshot.data?.docs[index]['name']}');
             });
          },
        ),
      ),
    );
  }
}
