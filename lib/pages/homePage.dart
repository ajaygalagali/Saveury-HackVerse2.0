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


                /*Breakfast*/
                SizedBox(height: 8,),
                ExpansionCard(
                onExpansionChanged: (bool isExpanded){
                  setState(() {
                    toggleBreakfast = !toggleBreakfast ;
                  });
                },
                borderRadius: 8,
                background: Container(
                  height: 275,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/breakfast.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: toggleBreakfast ? ColorFilter.srgbToLinearGamma() : null,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                title: Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Breakfast",
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
                    child: Column(
                      children: [
                        DishButton(dishName: "Alo Paratha",),
                        DishButton(dishName: "Masala Dosa",),
                        DishButton(dishName: "Idly Vada",),


                      ],
                    )
                  )
                ],
              ),

                /*Lunch*/
                SizedBox(height: 8,),
                ExpansionCard(
                  onExpansionChanged: (bool isExpanded){
                    setState(() {
                      toggleLunch = !toggleLunch ;
                    });
                  },
                  borderRadius: 8,
                  background: Container(
                    height: 275,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/lunch2.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: toggleLunch ? ColorFilter.srgbToLinearGamma() : null,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  title: Container(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
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
                      ],
                    ),
                  ),
                  children: <Widget>[
                    DishButton(dishName: "Panner Masala",),
                    DishButton(dishName: "Chapathi Palle",),
                    DishButton(dishName: "Anna Sambar",),
                  ],
                ),

                /*Dinner*/
                SizedBox(height: 8,),
                ExpansionCard(
                  onExpansionChanged: (bool isExpanded){
                    setState(() {
                      toggleDinner = !toggleDinner ;
                    });
                  },
                  borderRadius: 8,
                  background: Container(
                    height: 275,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/dinner2.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: toggleDinner ? ColorFilter.srgbToLinearGamma() : null,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  title: Container(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
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
                    DishButton(dishName: "Chicken Fry",),
                    DishButton(dishName: "Mutton",),
                    DishButton(dishName: "Anna Sambar",),
                  ],
                ),





              ],
            ),

          ),
        ),
      ),
    );
  }
}

class DishButton extends StatefulWidget {

  String dishName;
  DishButton({this.dishName});

  @override
  _DishButtonState createState() => _DishButtonState();
}

class _DishButtonState extends State<DishButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          print(widget.dishName);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.dishName,
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
