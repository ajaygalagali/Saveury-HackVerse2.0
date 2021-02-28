import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saveury/custom_widgets/ingredientsListItem.dart';
import 'package:saveury/models/ingredients.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class IngredientsPage extends StatefulWidget {
  List<Map<String,dynamic>> displayData;
  int index;
  String type;
  String displayName;
  String time;
  IngredientsPage({this.displayName,this.index,this.type,this.time});
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  bool isLoading =true;
  List<String> ingredientK;
  List<dynamic> ingredientV;
  double priceV;
  List<Color> iColors = [Colors.green,Colors.blueAccent,Colors.deepOrange,Colors.amber,Colors.brown];
  Future<void> generateIngredients()
  async{
    final url = "https://savoury-hackverse-default-rtdb.firebaseio.com/recipes/${widget.type}/${widget.time}/${widget.displayName.substring(1,widget.displayName.length-1)}.json";
    final url2 = "https://savoury-hackverse-default-rtdb.firebaseio.com/recomended/${widget.type}/${widget.time}/recomended_dish_price.json";

    var ingredientData = await http.get(url);
    print(url2);
    var priceData = await http.get(url2);
    setState(() {
      isLoading = true;
    });
    Map<String,dynamic> ingredientInfo = json.decode(ingredientData.body) as Map<String,dynamic>;
    double priceInfo = json.decode(priceData.body) as double;
    List<String> ingredientKeys = ingredientInfo.keys.toList();
    List<dynamic> ingredientValues = ingredientInfo.values.toList();
    ingredientK = ingredientKeys;
    ingredientV = ingredientValues;
    priceV = priceInfo;
    print(ingredientK.length);
    print(priceData.body);
  }

  void initState(){
    print("Hello");
    generateIngredients().then((value){
      isLoading = false;
    });

    print(isLoading);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading ? Center(child: CircularProgressIndicator(),): Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: iColors[Random.secure().nextInt(5)]

                  )
                ),

                Positioned(
                  top: 1,
                  child: Container(
                    margin: EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Icon(Icons.arrow_back, color: Colors.white,),
                        SizedBox(height: 32,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("${widget.displayName.substring(1,widget.displayName.length-1)}  ₹ ${priceV.toString()}",
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                ),
                              )
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.time,
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,

                                ),
                              )
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                Positioned(
                  bottom: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: ingredientK.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return InListItem(currentItem: ingredientK[index],currentItemData : ingredientV[index]);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
