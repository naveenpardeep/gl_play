import 'package:flutter/material.dart';
import 'package:gl_play/styles/text_style.dart';

class BorderRadiusButton extends StatelessWidget {
  final Color buttonColor;
  final Color labelColor;
  final String label;

  const BorderRadiusButton({required this.label,required this.labelColor,required this.buttonColor ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0),
        color: buttonColor,
      ),
      child:  Text(
        label,
        style: AppTextStyle.of(context).borderRadiusButtonLabelStyle(labelColor),
      ),
    );
  }
}
