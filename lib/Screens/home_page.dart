import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.gamepad),
        onPressed: () { print("Pressed"); }
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var name1 = [
    'Toefl',
    'Vocabulary',
    'Notes'
  ];
  var icon1 = [
    FontAwesomeIcons.noteSticky,
    FontAwesomeIcons.fileWord,
    FontAwesomeIcons.pencil
  ];
  var name2 = [
    'Book List',
    'Wish List',
    'Important Dates'
  ];
  var icon2 = [
    FontAwesomeIcons.bookAtlas,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.timeline
  ];
  String date = DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.extension,color: Colors.black,),
        backgroundColor: Color.fromRGBO(160, 232, 114, 1),
        title: Text('Skill Up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),),
      ),
      backgroundColor: Color.fromRGBO(198, 241, 170, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 170,
              width: width,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 15,left: 12,right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.teal.shade400,
                          child: GestureDetector(
                            onTap: (){
                              print("clicked");
                            },
                            child: GlassmorphicContainer(
                              height: 170,
                              width: width * .6,
                              borderRadius: 20,
                              blur: 70,
                              alignment: Alignment.center,
                              border: 2,
                              linearGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFffffff).withOpacity(0.01),
                                    Color(0xFFFFFFFF).withOpacity(0.01),
                                  ],
                                  stops: [
                                    0.1,
                                    1,
                                  ]),
                              borderGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFffffff).withOpacity(0.5),
                                  Color((0xFFFFFFFF)).withOpacity(0.5),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 6),
                                    child: Row(
                                      children: [
                                        Icon(icon1[index], color: Colors.teal,),
                                        SizedBox(width: 15,),
                                        Text(name1[index],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,letterSpacing: .5, fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ),
                                  Divider(thickness: 2,endIndent: 10,indent: 10,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext,index){
                return SizedBox(width: 20,);
              }, itemCount: 3),
            ),
            Divider(height: 30,),
            Divider(height: 1,),
            SizedBox(
              height: 170,
              width: width,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 15,left: 12,right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.orangeAccent.shade200,
                          child: GestureDetector(
                            onTap: (){
                              print("clicked");
                            },
                            child: GlassmorphicContainer(
                              height: 170,
                              width: width * .6,
                              borderRadius: 20,
                              blur: 70,
                              alignment: Alignment.center,
                              border: 2,
                              linearGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFffffff).withOpacity(0.01),
                                    Color(0xFFFFFFFF).withOpacity(0.01),
                                  ],
                                  stops: [
                                    0.1,
                                    1,
                                  ]),
                              borderGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFffffff).withOpacity(0.5),
                                  Color((0xFFFFFFFF)).withOpacity(0.5),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 6),
                                    child: Row(
                                      children: [
                                        Icon(icon2[index], color: Colors.indigo,),
                                        SizedBox(width: 15,),
                                        Text(name2[index],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,letterSpacing: .5, fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ),
                                  Divider(thickness: 2,endIndent: 10,indent: 10,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext,index){
                return SizedBox(width: 20,);
              }, itemCount: 3),
            ),
            Divider(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DigitalClock(
                    is24HourTimeFormat: false,
                    digitAnimationStyle: Curves.easeOutExpo,
                    areaWidth: width/2.25,
                    areaHeight: 37,
                    areaDecoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Container(
                    height: 37,
                    width: width/2.25,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(date,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
