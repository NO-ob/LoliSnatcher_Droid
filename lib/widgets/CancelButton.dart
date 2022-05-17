import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key, this.text = 'Cancel'}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[300],
        onPrimary: Colors.black,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(text),
    );
  }
}