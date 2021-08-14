import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDialog extends StatefulWidget {
  final String? title;
  final List<Widget> bodyWidgets;
  final CrossAxisAlignment horizontalAlignment;
  @override
  _InfoDialogState createState() => _InfoDialogState();
  InfoDialog(this.title,this.bodyWidgets,this.horizontalAlignment);
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Get.theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: widget.horizontalAlignment,
          children: [
            if(widget.title != null) 
              ...[
                Text(widget.title!, textScaleFactor: 2),
                const SizedBox(height: 10),
              ],
            ...widget.bodyWidgets
          ],
        )
      ),
    );
  }
}


