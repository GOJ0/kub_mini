import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class Productt extends StatefulWidget {
  const Productt({Key? key}) : super(key: key);

  @override
  State<Productt> createState() => _ProducttState();
}

class _ProducttState extends State<Productt> {
  List<String> myList=[
    'assets/images/tomato.png',
    'assets/images/potato.png',
    'assets/images/carrot.png',
    'assets/images/beet.png',
  ];
  List<String> data=[
    'Tomato Seeds',
    'Potato Seeds',
    'Carrot Seeds',
    'Beetroot Seeds',
  ];
  List<String> cost=[
    '430',
    '300',
    '670',
    '150',
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
