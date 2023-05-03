import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:organic_farm/product.dart';
import 'package:organic_farm/category.dart';
class fer extends StatefulWidget {
  const fer({Key? key}) : super(key: key);

  @override
  State<fer> createState() => _ferState();
}

class _ferState extends State<fer> {
  List<String> seeds=[
  "Potassic Fertilizers",
  "Complete Fertilizers",
  "Phosphate Fertilizers",
  "Compound Fertilizers",
  "Nitrogenous Fertilizers",
  "Organic Nitrogenous Fertilizers"
  ];
  List<String> myList=[
    'assets/images/a.png',
    'assets/images/n.png',
    'assets/images/p.png',
    'assets/images/ab.png',
  ];
  List<String> newList=[
    'assets/images/a.png',
    'assets/images/n.png',
    'assets/images/p.png',
    'assets/images/ab.png',
  ];
  List<String> cost=[
    '4300',
    '3000',
    '6700',
    '1500',
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
                      "Our fertilizer",
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
                    Tab(text:"Amide"),
                    Tab(text:"Nitrate"),
                    Tab(text:"Ammonical"),
                    Tab(text:"Potassic"),
                  ],),
                SizedBox(height: 20,),
                SizedBox(height: 300,
                  child: TabBarView(
                    children: [
                      Product(),
                      Product(),
                      Product(),
                      Product(),
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
                            subtitle: Text("Manures are the natural source of nutrients obtained from cow dung, leaves, human excreta, and other wastes.",style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Colors.grey),),
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


class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<String> myList=[
    'assets/images/a.png',
    'assets/images/n.png',
    'assets/images/p.png',
    'assets/images/ab.png',
  ];
  List<String> data=[
  "Amide fertilizer",
  "Nitrate fertilizer",
 "Ammonical fertilizer",
"Potassic fertilizer"
  ];
  List<String> cost=[
    '4300',
    '3000',
    '6700',
    '1050',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context,index){
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(width: 270,
                child:Stack(
                  children: [
                    SizedBox( height: 320,
                      child:Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          color: Color(0xFFF3F6FD),
                          intensity: 1,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Image(
                                  image: AssetImage(myList[index]),
                                  height: 250,
                                  width: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                data[index],
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: Text(
                                  "₹${cost[index]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Color(0xFFF35324C),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 4
                                  )
                                ]
                            ),
                            child: Icon(
                              CupertinoIcons.cart_fill_badge_plus,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
