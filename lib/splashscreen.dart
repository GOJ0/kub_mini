import 'package:flutter/material.dart';
import 'package:organic_farm/main.dart';

class Category1 extends StatefulWidget {
  const Category1({Key? key}) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  List<String> myList=[
    'assets/images/seller.png',
    'assets/images/buyer.png',
    'assets/images/admin1.png',
  ];
  List<String> data=[
    'Login As Seller',
    'Login As buyer',
    'Login As admin',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(143, 148, 251, 6),
            title: Text("Select Category".toUpperCase(), style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            actions: [Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.more_vert_rounded),
            )
            ]),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 180,
                  width: 100,
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75)
                        )
                      ],
                      color: Colors.blue
                  ),
                  child:  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 450,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(myList[index],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 7),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 0.75)
                                )
                              ],
                              color: Colors.black
                          ),
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[index].toUpperCase(), style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),),
                                Text("Click to proceed".toUpperCase(), style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w400, fontSize: 8),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          );
        })
      );
  }
}
