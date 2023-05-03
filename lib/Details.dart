import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateJobForum extends StatefulWidget {
  const CreateJobForum({Key? key}) : super(key: key);

  @override
  CreateJobForumState createState() => CreateJobForumState();
}

class CreateJobForumState extends State<CreateJobForum> {
  CollectionReference data= FirebaseFirestore.instance.collection('farm');
  TextEditingController firmNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();

  TextEditingController jobDescController = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController height = TextEditingController();
  String education = '2';
  String salary = '1 LPA';
  String experience = '0-1 Years';

   void adddata(){
     data.add({"name": firmNameController.text,
       "age":jobTitleController.text,
       "income":salary.toString()
     });
   }
  var edu = [
    '2',
    '3',
    '4',
    '5',
    'More then 5'
  ];

  var exp = [
    'Freshers',
    '0-1 Years',
    '1-3 Years',
    '3-5 Years',
    '5-10 Years',
    '10 Years'
  ];
  var sal = [
    '1 LPA',
    '2 LPA',
    '3 LPA',
    '4-5 LPA',
    '5-6 LPA',
    '6-7 LPA',
    '7-9 LPA',
    '9-10 LPA',
    '10 LPA',
  ];


  String? genderValue;
  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251,6),
          title: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Fill Details".toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
            actions: [Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.more_vert_rounded),
            )]
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        validator: (value) {
                          String text = value ?? "";
                          if (text.isEmpty) {
                            return "Please enter a valid name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Please fill name',
                        ),
                        controller: firmNameController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        validator: (value) {
                          String text = value ?? "";
                          if (text.isEmpty) {
                            return "Please enter age";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Age',
                          hintText: 'Please fill the age',
                        ),
                        controller: jobTitleController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        validator: (value) {
                          String text = value ?? "";
                          if (text.isEmpty) {
                            return "Please enter a valid description";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Description',
                          hintText: 'Describe key responsibilities, skills...',
                        ),
                        controller: jobDescController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListTile(
                  subtitle: const Text("Upload image"),
                  trailing: TextButton(
                    onPressed: () {

                    },
                    child: const Text("Upload"),
                  ),
                  title: const Text(
                    "Pick image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        title: const Text(
                          'Male',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, -5),
                              )
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationThickness: 4,
                          ),
                        ),
                        leading: Radio<String>(
                          value: "Male",
                          groupValue: genderValue,
                          onChanged: (value) {
                            setState(() {
                              genderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        title: const Text(
                          'Female',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, -5),
                              )
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            decorationThickness: 4,
                          ),
                        ),
                        leading: Radio<String>(
                          value: "Female",
                          groupValue: genderValue,
                          onChanged: (value) {
                            setState(() {
                              genderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    "Requirements".toUpperCase(),
                    style: const TextStyle(
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decorationColor: Colors.grey,
                      decorationThickness: 4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Select Period".toUpperCase(),
                                style: const TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(0, -5),
                                    )
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 4,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Card(
                                  elevation: 0,
                                  color: Color.fromRGBO(143, 148, 251,6),
                                  child: Center(
                                    child: DropdownButtonFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return "Please choose option";
                                        }
                                        return null;
                                      },
                                      value: experience,
                                      items: exp.map((String experience) {
                                        return DropdownMenuItem(
                                          value: experience,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 7,
                                              ),
                                              child: Text(experience),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          experience = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              "Select members".toUpperCase(),
                              style: const TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, -5),
                                  )
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey,
                                decorationThickness: 4,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Card(
                                elevation: 0,
                                color: Color.fromRGBO(143, 148, 251,6),
                                child: Center(
                                  child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return "Please choose option";
                                      }
                                      return null;
                                    },
                                    value: education,
                                    items: edu.map((String experience) {
                                      return DropdownMenuItem(
                                        value: experience,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 7,
                                            ),
                                            child: Text(experience),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        education = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        width: double.infinity,
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Select income".toUpperCase(),
                                style: const TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(0, -5),
                                    )
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 4,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Card(
                                  elevation: 0,
                                  color: Color.fromRGBO(143, 148, 251,6),
                                  child: Center(
                                    child: DropdownButtonFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return "Please choose option";
                                        }
                                        return null;
                                      },
                                      value: salary,
                                      items: sal.map((String experience) {
                                        return DropdownMenuItem(
                                          value: experience,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 7,
                                              ),
                                              child: Text(experience),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          salary = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: ' Location',
                          hintText: 'Please fill in Job Location',
                        ),
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Please fill in Job Location";
                          }
                          return null;
                        },
                        controller: jobLocationController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Note: The details cannot be modified  after the it is posted.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      adddata();
                    });
                  },
                  child: SizedBox(
                    width: 300,
                    height: 45,
                    child:  Container(
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
                        child: Text("POST", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      );
  }
}
