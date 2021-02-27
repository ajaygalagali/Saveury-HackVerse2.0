import 'package:flutter/material.dart';
import 'package:saveury/models/ingredients.dart';

class InListItem extends StatefulWidget {

  Ingredients currentItem;
  InListItem({this.currentItem});

  @override
  _InListItemState createState() => _InListItemState();
}

class _InListItemState extends State<InListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text(widget.currentItem.name)
              ],
              ),
              Column(children: [

                Text(widget.currentItem.quantity+" "+ widget.currentItem.unit)
              ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
