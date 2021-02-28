import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  int sliderValue = 4;
  bool hasSouthSelected = false;
  bool hasNorthSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saveury"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(

            children: [

              // Number of people
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Icon(Icons.family_restroom,
                        size: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("How many people are there in your family?"),
                      SizedBox(height: 10,),
                      Slider(
                        max: 10,
                        min: 1,
                        value: sliderValue.toDouble(),
                        onChanged: (double newValue){
                          setState(() {
                            sliderValue = newValue.round();
                            print(sliderValue);
                          });
                        },

                      ),
                      SizedBox(height: 5,),
                      Text(sliderValue.toString(),
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ) ,
                ),
              ),

              // Location
              Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Column(

                    children: [
                      SizedBox(height: 20,),
                      Icon(Icons.location_city,
                        size: 50,
                      ),
                      SizedBox(height: 20,),
                      Text("Where do you live?"),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            // hintText: "Enter your region of residence",
                            border: OutlineInputBorder(

                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Food choice
              Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [
                      SizedBox(height: 20,),
                      Icon(Icons.brunch_dining,
                        size: 50,
                      ),
                      SizedBox(height: 20,),
                      Align(child: Text("Select the food type you like",),
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RaisedButton(
                              child: Text("South Indian"),
                              color: hasSouthSelected ? Colors.green : Colors.white,

                              onPressed: (){
                                print("South");
                                setState(() {
                                  hasSouthSelected = !hasSouthSelected;
                                });
                              },
                            ),
                            RaisedButton(
                              child: Text("North Indian"),
                              color: hasNorthSelected ? Colors.green : Colors.white,

                              onPressed: (){
                                print("North");
                                setState(() {
                                  hasNorthSelected = !hasNorthSelected;
                                });
                              },
                            )

                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),

              // Next Button
              RaisedButton(
                child: Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                color: Colors.blue,
                onPressed: (){
                  print("Get Started");
                },

              )
            ],

          ),
        ),
      ),
    );
  }
}
