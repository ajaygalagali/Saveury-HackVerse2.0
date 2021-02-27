import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool toggleBreakfast = false;
  bool toggleLunch = false;
  bool toggleDinner = false;

  double imageScale = 1.0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Text("Saveury",
            style: TextStyle(
              color: Theme.of(context).primaryColor
            ),
          ),
          leading: Icon(
            Icons.emoji_food_beverage,
            color: Theme.of(context).primaryColor,
            ),

          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Today's",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,

                          ),
                        )
                    ),
                  ),
                ),
                // Text - Suggestion
                Padding(
                  padding: const EdgeInsets.only(right: 8,left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Recommendations",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 8,),

                // Breakfast
                InkWell(
                  onTap: (){
                    setState(() {
                      toggleBreakfast = !toggleBreakfast;
                    });
                  },
                  child: Card(
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/breakfast.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Column(
                            children: [
                              Text("Breakfast",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )
                                  )
                              ),

                              toggleBreakfast ? Text("This is dropdown!",
                                style: TextStyle(
                                    fontSize:32,
                                  color: Colors.white
                                ),
                              ) : SizedBox()

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),

                // Lunch
                Card(
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/lunch2.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Lunch",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),

                // Dinner
                Card(
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/dinner2.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Dinner",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          )
                      ),
                    ),
                  ),
                ),

              ExpansionCard(
                onExpansionChanged: (bool isExpanded){
                  setState(() {
                    toggleBreakfast = !toggleBreakfast ;
                  });
                },
                borderRadius: 8,
                background: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/breakfast.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: toggleBreakfast ? ColorFilter.srgbToLinearGamma() : ColorFilter.linearToSrgbGamma(),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                title: Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text("Dinner",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Container(
                    child: Text("Content goes over here ! \n Content goes over here ! \n Content goes over here ! \n Content goes over here ! \n",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
              ],
            ),

          ),
        ),
      ),
    );
  }
}
