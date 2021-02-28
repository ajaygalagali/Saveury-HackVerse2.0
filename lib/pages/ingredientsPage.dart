import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saveury/custom_widgets/ingredientsListItem.dart';
import 'package:saveury/models/ingredients.dart';
import 'dart:convert';
class IngredientsPage extends StatefulWidget {
  List<Map<String,dynamic>> displayData;
  int index;
  int type;
  String displayName;
  IngredientsPage({this.displayData,this.displayName,this.index,this.type});
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {

  List<Color> iColors = [Colors.green,Colors.blueAccent,Colors.deepOrange,Colors.amber,Colors.brown];

  @override
  Widget build(BuildContext context) {
    List keysD = widget.displayData[widget.index].keys.toList();
    List valuesD = widget.displayData[widget.index].values.toList();
    String heading;
    if(widget.type == 0)
      {
        heading="BREAKFAST";
      }else if(widget.type == 1){
      heading = "LUNCH";
    }
    else heading = "DINNER";
    return SafeArea(
      child: Scaffold(
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
                          child: Text(widget.displayName,
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
                          child: Text(heading,
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
                        itemCount: keysD.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return InListItem(currentItem: keysD[index],currentItemData : valuesD[index]);
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
