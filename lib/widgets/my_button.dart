import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.btnText,
      required this.btnWidth,
      required this.onPress,
      this.btnColor = Colors.teal});
  final String btnText;
  final double btnWidth;
  final void Function() onPress;
  final Color btnColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: btnWidth,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        height: 35,
        child: Center(
          child: Text(
            btnText,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
