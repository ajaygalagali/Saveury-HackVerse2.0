import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/ingredientsPage.dart';
import 'dart:convert';
class DishButton extends StatefulWidget {
  int index;
  String time;
  String type;
  String dishName;
  DishButton({this.dishName,this.index,this.type,this.time});

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
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return IngredientsPage(displayName:widget.dishName,index:widget.index,type:widget.type,time:widget.time);
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