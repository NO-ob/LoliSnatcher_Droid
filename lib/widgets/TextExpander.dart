import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextExpander extends StatefulWidget {
  String title;
  List<Text> bodyList;
  TextExpander({required this.title, required this.bodyList});
  @override
  _TextExpanderState createState() => _TextExpanderState();
}

class _TextExpanderState extends State<TextExpander> {
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.title,
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
              IconButton(
                icon: Icon(
                    showText ? Icons.remove : Icons.add,
                    color: Get.theme.colorScheme.secondary
                ),
                onPressed: () {
                  setState(() {
                    showText = !showText;
                  });
                },
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: showText ? Container(
              key: UniqueKey(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.bodyList,
                ),
              ) :
            Container(
              child: Center(
                key: UniqueKey(),
                child: SizedBox(
                  width: 0,
                  height: 0,
                ),
              ),
            )
            ),
          Divider(
            height: 10,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Get.theme.colorScheme.secondary,
          ),
        ],
      )
    );
  }
}
