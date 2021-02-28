import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/ingredientsPage.dart';
import 'dart:convert';
class DishButton extends StatefulWidget {
  int index;
  int type;
  String dishName;
  List<Map<String,dynamic>> dishInfo;
  DishButton({this.dishName,this.dishInfo,this.index,this.type});

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
          for(int i =0;i<widget.dishInfo.length;i++)
            {
              print(json.encode(widget.dishInfo[i]));
            }
          print(widget.dishName);
          print(widget.dishInfo.length);
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return IngredientsPage(displayData: widget.dishInfo,displayName:widget.dishName,index:widget.index,type:widget.type);
          }));
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