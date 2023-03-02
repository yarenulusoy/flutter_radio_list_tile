import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget{
  final Widget child;
  final Color bgColor,sideColor;
  const CardWidget(
      {Key? key,
        required this.child,
        this.bgColor = Colors.white,
        this.sideColor = Colors.transparent,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder( side:BorderSide(color: sideColor),borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}