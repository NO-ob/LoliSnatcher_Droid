import 'package:flutter/material.dart';

class TextExpander extends StatefulWidget {
  const TextExpander({Key? key, required this.title, required this.bodyList}) : super(key: key);
  final String title;
  final List<Text> bodyList;

  @override
  State<TextExpander> createState() => _TextExpanderState();
}

class _TextExpanderState extends State<TextExpander> {
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.title,
                textScaleFactor: 1.2,
                style: const TextStyle(fontWeight: FontWeight.bold)
            ),
            IconButton(
              icon: Icon(
                  showText ? Icons.remove : Icons.add,
                  color: Theme.of(context).colorScheme.secondary
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
          duration: const Duration(milliseconds: 200),
          child: showText ? Container(
            key: UniqueKey(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.bodyList,
              ),
            ) :
          Center(
            key: UniqueKey(),
            child: const SizedBox(
              width: 0,
              height: 0,
            ),
          )
          ),
        Divider(
          height: 10,
          thickness: 1,
          indent: 5,
          endIndent: 5,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
