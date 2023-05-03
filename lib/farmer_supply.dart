
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_farm/image_pick.dart';

int count=1;
class FarmerSupply extends StatefulWidget {
  const FarmerSupply({Key? key}) : super(key: key);

  @override
  State<FarmerSupply> createState() => _FarmerSupplyState();
}

class _FarmerSupplyState extends State<FarmerSupply> {

  List<Color> colorr=[
    // Color( 0xFF311B92),
    Color(0xFF512DA8),
    Color(0xFF7E57C2),
    Color( 0xFF311B92),
    Color(0xFF512DA8),
    Color(0xFF7E57C2),
    Color( 0xFF311B92),
    Color(0xFF512DA8),
    Color(0xFF7E57C2),
  ];
  final _formKey=GlobalKey<FormState>();
  String f = '';
  String e = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        child: ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    tileColor:colorr[index] ,
                    leading:CircleAvatar(
                      backgroundColor: Colors.white24,
                     child: Am(),
                    ) ,
                    title:    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey))
                      ),
                      child: TextFormField(
                        key: ValueKey('f'),
                        // controller: email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter name",
                            hintStyle: TextStyle(color: Colors.grey[400])
                        ),
                        validator:(value){
                          if(value!.isEmpty)
                          {
                            return 'Please Enter Valid Name';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            f = value!;
                          });
                        },
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child:    Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey))
                        ),
                        child: TextFormField(
                          key: ValueKey('e'),
                          // controller: email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter cost",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                          validator:(value){
                            if(value!.isEmpty)
                            {
                              return 'Please Enter Valid cost';
                            }
                            else
                            {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() async {
                              e = value!;
                               FirestoreServices.saveUser(f, e);
                            });
                          },
                        ),
                      ),),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white24,),
                  ),

                ],
              );
            }),
      ),
    );

  }
}


class FirestoreServices {
  static saveUser(String name, cost) async {
    await FirebaseFirestore.instance
        .collection('data')
        .doc()
        .set({'name': name, 'cost': cost});
  }
}