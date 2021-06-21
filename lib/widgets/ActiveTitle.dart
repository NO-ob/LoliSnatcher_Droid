import 'package:flutter/cupertino.dart';

import '../SnatchHandler.dart';

class ActiveTitle extends StatefulWidget {
  final SnatchHandler snatchHandler;
  @override
  _ActiveTitleState createState() => _ActiveTitleState();
  ActiveTitle(this.snatchHandler);
}

class _ActiveTitleState extends State<ActiveTitle> {
  bool isSnatching = false;
  String snatchStatus = "";

  @override
  void initState(){
    super.initState();
    widget.snatchHandler.snatchActive.addListener(setSnatchActive);
    widget.snatchHandler.snatchStatus.addListener(setSnatchStatus);
  }

  void setSnatchActive() {
    isSnatching = widget.snatchHandler.snatchActive.value;
    setState(() { });
  }

  void setSnatchStatus(){
    snatchStatus = widget.snatchHandler.snatchStatus.value;
    setState(() { });
  }

  @override
  void dispose(){
    widget.snatchHandler.snatchActive.removeListener(setSnatchActive);
    widget.snatchHandler.snatchStatus.removeListener(setSnatchStatus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isSnatching ? Text("Snatching: ${snatchStatus}") : Text("Loli Snatcher");
  }
}