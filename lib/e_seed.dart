import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:organic_farm/product.dart';
import 'package:organic_farm/category.dart';
class Seed extends StatefulWidget {
  const Seed({Key? key}) : super(key: key);

  @override
  State<Seed> createState() => _SeedState();
}

class _SeedState extends State<Seed> {
  List<String> seeds=[
 'peas',
    'banana',
    'mango',
    'grapes',
    'onion',
    'watermelon'
  ];
  List<String> myList=[
    'assets/images/tomato.png',
    'assets/images/potato.png',
    'assets/images/carrot.png',
    'assets/images/beet.png',
  ];
  List<String> newList=[
    'assets/images/tomato.png',
    'assets/images/banana.png',
    'assets/images/mango.png',
    'assets/images/beet.png',
  ];
  List<String> cost=[
    '430',
    '300',
    '670',
    '150',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50,left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Seeds",
                      style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: (){},
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12),),
                          color: Color(0xFFF3F6FD),
                          intensity: 1,
                        ),
                        child: Padding(padding: EdgeInsets.all(10),
                        child: Icon(Icons.search),),
                      ),
                    ),)
                  ],
                ),
                SizedBox(height: 20,),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black54,
                  labelColor: Colors.black,
                  isScrollable: true,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                  unselectedLabelColor: Colors.black38,
                  tabs:[
                  Tab(text:"Tomato"),
                  Tab(text:"Potato"),
                  Tab(text:"Carrot"),
                  Tab(text:"Beetroot"),
                ],),
                SizedBox(height: 20,),
                SizedBox(height: 300,
                child: TabBarView(
                  children: [
                   Productt(),
                    Productt(),
                    Productt(),
                    Productt(),
                  ],
                ),),
                SizedBox(
                  height: 10,
                ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection:Axis.horizontal ,
                        itemCount: 5,
                        itemBuilder: (context,index){
return InkWell(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cat(seeds[index],cost[index])),
    );
  },
  child: Neumorphic(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.symmetric(
      vertical: 10,horizontal: 25
    ),
    style: NeumorphicStyle(
      shape: NeumorphicShape.flat,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
      color: Color(0xFFF3F6FD),
      intensity: 1
    ),
    child: Center(
      child: Text(seeds[index].toUpperCase(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
    ),
  ),
);
                    }),
                  ),
                SizedBox(
                  height: 10,
                ),
                Text( "Best Offers",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.black54),),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cat(seeds[index],cost[index])),
                          );
                        } ,
                        minLeadingWidth: 70,
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Image(
                            image: AssetImage(newList[index]),
                          ),
                        ),
                        title: Text(seeds[index].toUpperCase(),style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,color: Colors.black),),
                        subtitle: Text("Healthcare professionals know that fruit is a highly nutritious, delicious, and convenient addition to any diet.",style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Colors.grey),),
                      trailing: Text("₹${cost[index]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                      ),
                      Divider(
                        color: Colors.black,
                      )
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
