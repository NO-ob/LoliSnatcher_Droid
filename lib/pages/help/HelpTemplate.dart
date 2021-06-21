
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpTemplate extends StatefulWidget {
  HelpTemplate();
  @override
  _HelpTemplateState createState() => _HelpTemplateState();
}

class _HelpTemplateState extends State<HelpTemplate> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Template"),
        ),
        body: Center(
          child: ListView(
            children: [
                  ],
                ),
              ),
          );
  }
}
