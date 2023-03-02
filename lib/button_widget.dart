import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgColor;
  final VoidCallback onPressed;
  final Widget widgetBack, widgetRight;

  const ButtonWidget(
      {Key? key,
        required this.bgColor,
        required this.onPressed,
        required this.widgetBack,
        required this.widgetRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.purple),
        backgroundColor: bgColor,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widgetBack,
          widgetRight,
        ],
      ),
    );
  }
}
