import 'package:flutter/cupertino.dart';

class ScrollingText extends StatefulWidget {
  String text;
  int size;
  String mode;
  @override
  _ScrollingTextState createState() => _ScrollingTextState();
  ScrollingText(this.text,this.size,this.mode);
}

class _ScrollingTextState extends State<ScrollingText> {
  String displayText;
  int counter = 0;
  String bufferText = "";
  bool forward = true;
  bool disposed = false;
  @override
  void initState(){
    counter = 0;
    bufferText = "";
    forward = true;
  }
  @override
  void dispose(){
    disposed = true;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (counter+widget.size - 1 > widget.text.length && counter != 0){
      setState(() {
        initState();
      });
    } else if (counter+widget.size - 1 > widget.text.length){
      return Text(widget.text, textAlign: TextAlign.left);
    } else {
      switch(widget.mode){
        case ("bounce"):
          bounce();
          break;
        case ("scroll"):
          scroll();
          break;
        case ("infinite"):
          infinite();
          break;
      }
    }
    return Text(" " + displayText,textAlign: TextAlign.left);
  }
  void bounce(){
    Future.delayed(const Duration(milliseconds: 250), () {
      if (!disposed){
        if ((counter+(widget.size) >= widget.text.length)) {
          setState(() {
            forward = false;
          });
        } else if (!forward && counter == 0){
          setState(() {
            forward = true;
          });
        }
        if (forward){
          setState(() {
            counter ++;
          });
        } else {
          setState(() {
            counter --;
          });
        }
      }
    });
    displayText = " " + widget.text.substring(counter, counter +widget.size);
  }
  void scroll() {
    Future.delayed(const Duration(milliseconds: 250), () {
      if(!disposed){
        if ((counter + (widget.size) < widget.text.length)) {
          setState(() {
            counter++;
          });
        } else {
          counter = 0;
        }
      }
    });
    displayText = " " + widget.text.substring(counter, counter + widget.size);
  }
  void infinite() {
    Future.delayed(const Duration(milliseconds: 250), () {
      if(!disposed){
        if (bufferText.length < 1){
          if ((counter + (widget.size) < widget.text.length)) {
            setState(() {
              counter++;
            });
          } else {
            setState(() {
              bufferText = displayText;
            });
          }
        } else {
          if (bufferText.length > 1){
            setState(() {
              bufferText = bufferText.substring(1,bufferText.length);
            });
          } else {
            setState(() {
              bufferText = "";
              counter = 0;
            });
          }
        }
      }
    });
    if (bufferText.length < 1){
      displayText = " " + widget.text.substring(counter, counter + widget.size);
    } else {
      displayText = bufferText + " " + widget.text.substring(0, widget.size - (bufferText.length - 1));
    }
  }
}
