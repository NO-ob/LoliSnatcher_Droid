import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/widgets/SizeConfig.dart';

class InfoDialog extends StatefulWidget {
  String? title;
  List<Widget> bodyWidgets;
  CrossAxisAlignment horizontalAlignment;
  @override
  _InfoDialogState createState() => _InfoDialogState();
  InfoDialog(this.title,this.bodyWidgets,this.horizontalAlignment);
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        margin: EdgeInsets.all(10),
        // set to max 90% of any dimension
        constraints: BoxConstraints(maxHeight: SizeConfig.safeBlockVertical! * 90, maxWidth: SizeConfig.safeBlockHorizontal! * 90, minHeight: 100, minWidth: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(widget.title != null) 
              ...[
                Text(widget.title!, textScaleFactor: 2),
                const SizedBox(height: 10),
              ],
            Column(
              crossAxisAlignment: widget.horizontalAlignment,
              children: widget.bodyWidgets,
            )
          ],
        )
      ),
    );
  }
}


