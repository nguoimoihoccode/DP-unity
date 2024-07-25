import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  TextDecoration? textDecoration;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLine;
  CustomText({
    super.key,
    this.text,
    this.fontWeight = FontWeight.w100,
    this.color = Colors.black87,
    this.fontSize = 15.5,
    this.textDecoration,
    this.textAlign,
    this.maxLine,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    return Text(
      text!,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        color: color,
        fontSize: kW <= 450 ? fontSize : fontSize! + 5,
        fontWeight: fontWeight,
        decoration: textDecoration,
        height: 1.3,
      ),
    );
  }
}
