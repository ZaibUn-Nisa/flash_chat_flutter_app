import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color? myColor;
  final String? mybuttonText;
  final Function? myButtonFunction;
  const RoundedButton(
      {super.key, this.myColor, this.mybuttonText, this.myButtonFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: myColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            myButtonFunction;
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            mybuttonText!,
          ),
        ),
      ),
    );
  }
}
