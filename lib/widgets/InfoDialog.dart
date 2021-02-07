import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatefulWidget {
  String title;
  List<Widget> bodyWidgets;
  @override
  _InfoDialogState createState() => _InfoDialogState();
  InfoDialog(this.title,this.bodyWidgets);
}

class _InfoDialogState extends State<InfoDialog> {
  List<Widget> widgets = new List();
  @override
  void initState(){
    super.initState();
    widgets.insert(0, Text(widget.title, textScaleFactor: 2,));
    widgets.addAll(widget.bodyWidgets);
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, textScaleFactor: 2,),
            Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: widget.bodyWidgets,
                )
            )
          ],
        ),
    );
  }
}


