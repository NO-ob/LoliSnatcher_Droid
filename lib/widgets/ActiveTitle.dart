import 'package:flutter/cupertino.dart';

import '../SnatchHandler.dart';

class ActiveTitle extends StatefulWidget {
  SnatchHandler snatchHandler;
  bool isSnatching = false;
  String snatchStatus = "";
  @override
  _ActiveTitleState createState() => _ActiveTitleState();
  ActiveTitle(this.snatchHandler);
}

class _ActiveTitleState extends State<ActiveTitle> {

  @override
  void initState(){
    //widget.snatchHandler.snatchActive.value = false;
    widget.snatchHandler.snatchActive!.addListener(snatchActive);
    widget.snatchHandler.snatchStatus!.addListener(snatchStatus);
  }
  void snatchActive() {
    setState(() {
      widget.isSnatching = widget.snatchHandler.snatchActive!.value;
    });
  }
  void snatchStatus(){
    setState(() {
      widget.snatchStatus = widget.snatchHandler.snatchStatus!.value;
    });
  }
  @override
  void dispose(){
    widget.snatchHandler.snatchStatus!.removeListener(snatchActive);
    widget.snatchHandler.snatchStatus!.removeListener(snatchStatus);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return widget.isSnatching ? Text("Snatching: ${widget.snatchStatus}") : Text("Loli Snatcher");
  }
}