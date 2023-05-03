import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final Uri _url = Uri.parse('www.youtube.com');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 6),
          title: Text("How to farm potato".toUpperCase(), style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
          actions: [Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.more_vert_rounded),
          )
          ]),
      body: Column(
        children: [
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/potato.png'),

                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("POTATO BRIEF", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 20),),
          ),
          Text("DESCRIPTION", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 12),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            child: Text("Potato, ( Solanum tuberosum ), annual plant in the nightshade family ( Solanaceae ), grown for its starchy edible tubers. The potato is native to the Peruvian-Bolivian Andes and is one of the world’s main food crops.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 12),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            child: Text("Potatoes are thought to have been independently domesticated several times and were largely cultivated in South America by the Incas as early as 1,800 years ago. Encountered by the invading Spaniards, potatoes were introduced into Europe during the second half of the 16th century. By the end of the 17th century the plant was a major crop in Ireland, and by the end of the 18th century it was a major crop in continental Europe, particularly Germany, and in the west of England.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,fontSize: 12),),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: SizedBox(
              width: 320,
              child: Container(
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
                  child: Text("MORE DETAILS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: SizedBox(
              width: 320,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    onPressed: _launchUrl;
                  });

                },
                child: Container(
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
                    child: Text("VIDEO  TUTORIAL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


