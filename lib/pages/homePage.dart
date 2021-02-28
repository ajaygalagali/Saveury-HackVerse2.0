import 'package:expansion_card/expansion_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_widgets/dishButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool toggleBreakfast = false;
  bool toggleLunch = false;
  bool toggleDinner = false;
  bool isLoading = true;
  double imageScale = 1.0;
  List<Map<String,dynamic>> dishData;
  List<DishButton> dishesName;
  List<Map<String,dynamic>> dishDataL;
  List<DishButton> dishesNameL;
  List<Map<String,dynamic>> dishDataD;
  List<DishButton> dishesNameD;

  List<DishButton> rBreakfast =[];
  List<DishButton> rLunch = [];
  List<DishButton> rDinner = [];

  Future<void> fetchRecommended(String typeFood, String timeFood) async {
    String foodUrl = "https://savoury-hackverse-default-rtdb.firebaseio.com/recomended/$typeFood/$timeFood/recomended_dish.json";
    var foodData = await http.get(foodUrl);
    setState(() {
      isLoading = true;
    });
    print(typeFood+" "+ timeFood+"->"+foodData.body);

    int counterB = 0,counterL=0,counterD=0;
    if(timeFood == "breakfast"){
      var data = DishButton(index: counterB,dishName: foodData.body.substring(1,foodData.body.length-1),time:timeFood,type:typeFood);
      counterB++;
      setState(() {
        rBreakfast.add(data);
      });

    }else if(timeFood == "lunch"){
      var data = DishButton(index: counterL,dishName: foodData.body.substring(1,foodData.body.length-1),time:timeFood,type:typeFood);
      counterL++;
      setState(() {
        rLunch.add(data);
      });
    }else{
      var data = DishButton(index: counterD,dishName: foodData.body.substring(1,foodData.body.length-1),time:timeFood,type:typeFood);
      counterD++;
      setState(() {
        rDinner.add(data);
      });
    }

  }
  Map<String,dynamic> userInfo;
  Future<Map<String,dynamic>> getUserPreference()
  async{
    final userId = FirebaseAuth.instance.currentUser.uid;
    String userUrl = "https://savoury-hackverse-default-rtdb.firebaseio.com/userData/$userId.json";
    var userData = await http.get(userUrl);
    Map<String,dynamic> userMap = json.decode(userData.body) as Map<String,dynamic>;
    List userValues = userMap.values.toList();
    userInfo = userValues[0] as Map<String,dynamic>;
    return userValues[0] as Map<String,dynamic>;
  }

  // Future<void> fetchData ()async{
  //   List<Map<String,dynamic>> dishes =[];
  //   List<DishButton> dishName = [];
  //   List<Map<String,dynamic>> dishesL =[];
  //   List<DishButton> dishNameL = [];
  //   List<Map<String,dynamic>> dishesD =[];
  //   List<DishButton> dishNameD = [];
  //
  //   const breakfast_southIndian = "https://savoury-hackverse-default-rtdb.firebaseio.com/recipes/south_indian/breakfast.json";
  //   const lunch_southIndian = "https://savoury-hackverse-default-rtdb.firebaseio.com/recipes/south_indian/lunch.json";
  //   const dinner_southIndian = "https://savoury-hackverse-default-rtdb.firebaseio.com/recipes/south_indian/dinner.json";
  //
  //
  //
  //   var res = await http.get(breakfast_southIndian);
  //   final extractedData = json.decode(res.body) as Map<String,dynamic>;
  //   int count = 0;
  //   extractedData.forEach((key, value) { dishes.add(value);dishName.add(DishButton(dishName: key,dishInfo: dishes,index: count,type:0));count++;});
  //
  //   res = await http.get(lunch_southIndian);
  //   final extractedDataLunch = json.decode(res.body) as Map<String,dynamic>;
  //   count=0;
  //   extractedDataLunch.forEach((key, value) {dishesL.add(value);dishNameL.add(DishButton(dishName: key,dishInfo: dishesL,index:count,type:1));count++; });
  //
  //   res = await http.get(dinner_southIndian);
  //   count=0;
  //
  //
  //   final extractedDataDinner = json.decode(res.body) as Map<String,dynamic>;
  //   extractedDataDinner.forEach((key, value) {dishesD.add(value);dishNameD.add(DishButton(dishName: key,dishInfo: dishesD,index: count,type:2));count++;});
  //   dishData = dishes;
  //   dishesName = dishName;
  //   dishDataL = dishesL;
  //   dishesNameL = dishNameL;
  //   dishDataD = dishesD;
  //   dishesNameD = dishNameD;
  // }
  @override
  void initState() {
    // TODO: implement initState

      getUserPreference().then((value) {
        if(value['isNorth'])
          {
            fetchRecommended("north_indian", "breakfast").then((value) {
              isLoading = false;
            });
          fetchRecommended("north_indian", "lunch").then((value) {
            isLoading = false;
          });
          fetchRecommended("north_indian", "dinner").then((value) {
            isLoading = false;
          });
          }

        if(value['isSouth'])
          {
            fetchRecommended("south_indian", "breakfast").then((value) {
              isLoading = false;
            });
            fetchRecommended("south_indian", "lunch").then((value) {
              isLoading = false;
            });
            fetchRecommended("south_indian", "dinner").then((value) {
              isLoading = false;
            });
          }

      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:isLoading ? Center(child: CircularProgressIndicator(),): Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.logout),
            color: Theme.of(context).primaryColor,
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed("auth");
            },
            )
          ],
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
                  height: 200,
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
                      children: rBreakfast,
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
                    height: 200,
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
                  children: rLunch,
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
                    height: 200,
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
                  children: rDinner,
                ),





              ],
            ),

          ),
        ),
      ),
    );
  }
}


