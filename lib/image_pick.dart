import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organic_farm/category.dart';
import 'package:organic_farm/product.dart';
import 'package:organic_farm/shopping.dart';
String selectedImagePath = '';
List<String> upload_image=[];
class ImScreen extends StatefulWidget {
  const ImScreen({Key? key}) : super(key: key);

  @override
  State<ImScreen> createState() => _ImScreenState();
}

class _ImScreenState extends State<ImScreen> {

  Future selectImage(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImagePath == ''
                ? Image.asset('assets/images/camera.png', height: 200, width: 200, fit: BoxFit.fill,)
                : Image.file(File(selectedImagePath), height: 200, width: 200, fit: BoxFit.fill,),
            Text(
              'Select Image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () async {
                  selectImage(context);
                  setState(() {});
                },
                child: const Text('Select')),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  //
  // Future selectImage() {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20.0)), //this right here
  //           child: Container(
  //             height: 150,
  //             child: Padding(
  //               padding: const EdgeInsets.all(12.0),
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Select Image From !',
  //                     style: TextStyle(
  //                         fontSize: 18.0, fontWeight: FontWeight.bold),
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       GestureDetector(
  //                         onTap: () async {
  //                           selectedImagePath = await selectImageFromGallery();
  //                           print('Image_Path:-');
  //                           print(selectedImagePath);
  //                           if (selectedImagePath != '') {
  //                             Navigator.pop(context);
  //                             setState(() {});
  //                           } else {
  //                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                               content: Text("No Image Selected !"),
  //                             ));
  //                           }
  //                         },
  //                         child: Card(
  //                             elevation: 5,
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Column(
  //                                 children: [
  //                                   Image.asset(
  //                                     'assets/images/gallery.png',
  //                                     height: 60,
  //                                     width: 60,
  //                                   ),
  //                                   Text('Gallery'),
  //                                 ],
  //                               ),
  //                             )),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () async {
  //                           selectedImagePath = await selectImageFromCamera();
  //                           print('Image_Path:-');
  //                           print(selectedImagePath);
  //
  //                           if (selectedImagePath != '') {
  //                             Navigator.pop(context);
  //                             setState(() {});
  //                           } else {
  //                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                               content: Text("No Image Captured !"),
  //                             ));
  //                           }
  //                         },
  //                         child: Card(
  //                             elevation: 5,
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               child: Column(
  //                                 children: [
  //                                   Image.asset(
  //                                     'assets/images/camera.png',
  //                                     height: 60,
  //                                     width: 60,
  //                                   ),
  //                                   Text('Camera'),
  //                                 ],
  //                               ),
  //                             )),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
  //
  // selectImageFromGallery() async {
  //   XFile? file = await ImagePicker()
  //       .pickImage(source: ImageSource.gallery, imageQuality: 10);
  //   if (file != null) {
  //     return file.path;
  //   } else {
  //     return '';
  //   }
  // }
  //
  // //
  // selectImageFromCamera() async {
  //   XFile? file = await ImagePicker()
  //       .pickImage(source: ImageSource.camera, imageQuality: 10);
  //   if (file != null) {
  //     return file.path;
  //   } else {
  //     return '';
  //   }
  // }
}


selectImageFromGallery() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 10);
  if (file != null) {
  upload_image.add(file.path);
    return file.path;
  } else {
    return '';
  }
}

//
selectImageFromCamera() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 10);
  if (file != null) {
    return file.path;
  } else {
    return '';
  }
}
class Am extends StatefulWidget {
  const Am({Key? key}) : super(key: key);

  @override
  State<Am> createState() => _AmState();
}

class _AmState extends State<Am> {
  Future selectImage(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            upload_image.add(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          selectImage(context);
          setState(() {
          });
        },
        child: Container(
          child:  selectedImagePath == ''
              ? Image.asset('assets/images/camera.png', height: 200, width: 200, fit: BoxFit.fill,)
              : Image.file(File(selectedImagePath), height: 200, width: 200, fit: BoxFit.fill,),
        ),
      ),
    );
  }
}




class Shopping extends StatelessWidget {
  List<String> seeds=[
    'peas',
    'banana',
    'mango',
    'grapes',
    'onion',
    'watermelon'
  ];
  List<String> cost=[
'10',
    '20',
    '40',
    '50',
    '10',
    '20',
    '40',
    '50',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index)
        {
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
                            "Farm Ecommerce",
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
                      // TabBar(
                      //   indicatorSize: TabBarIndicatorSize.label,
                      //   indicatorColor: Colors.black54,
                      //   labelColor: Colors.black,
                      //   isScrollable: true,
                      //   labelStyle: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500
                      //   ),
                      //   unselectedLabelColor: Colors.black38,
                      //   tabs:[
                      //     Tab(text:"vegetables"),
                      //     Tab(text:"fruits"),
                      //     Tab(text:"fertilizers"),
                      //     Tab(text:"other things"),
                      //   ],),
                      // SizedBox(height: 20,),
                      // SizedBox(height: 300,
                      //   child: TabBarView(
                      //     children: [
                      //       Productt(),
                      //       Productt(),
                      //       Productt(),
                      //       Productt(),
                      //     ],
                      //   ),),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection:Axis.horizontal ,
                            itemCount: 1,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Cat(seeds[index],cost[index])),
                                  );
                                },
                                // child: Neumorphic(
                                //   margin: EdgeInsets.all(10),
                                //   padding: EdgeInsets.symmetric(
                                //       vertical: 10,horizontal: 25
                                //   ),
                                //   style: NeumorphicStyle(
                                //       shape: NeumorphicShape.flat,
                                //       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                                //       color: Color(0xFFF3F6FD),
                                //       intensity: 1
                                //   ),
                                //   child: Center(
                                //     child: Text(seeds[index].toUpperCase(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                                //   ),
                                // ),
                              );
                            }),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text( "Best Offers",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.black54),),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: upload_image.length,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                index%2==0?ListTile(
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
                                    child:Image.file(File(upload_image[index]), height: 200, width: 200, fit: BoxFit.fill,)
                                  ),
                                  title: Text(seeds[index].toUpperCase(),style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,color: Colors.black),),
                                  subtitle: Text("Healthcare professionals know that fruit is a highly nutritious, delicious, and convenient addition to any diet.",style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Colors.grey),),
                                  trailing: Text("₹${cost[index]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                                ):SizedBox(),
                                index%2==0?Divider(
                                  color: Colors.black,
                                ):SizedBox()
                              ],
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          );


        },
      ),
    );
  }
}


