import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class Cat extends StatelessWidget {
 var  name;
var cost;

  Cat(this.name, this.cost);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251,6),
      body: Container(
        height: 500,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15,top: 50,left:15),
            child: Column(

              children: [
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.pop(context);
                        }
                      ),
                      Text("Product",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 25
                      ),),
                      Neumorphic(
                        style: NeumorphicStyle(
                          shape:NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          color: Color(0xFFF3F6FD),
                          intensity: 1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.favorite,
                          color: Colors.red,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

