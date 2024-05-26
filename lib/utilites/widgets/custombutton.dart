import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:drive_app/utilites/appcolors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final Color txtColor;

  final double borderRadius;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColor.kmaincolor,
    this.borderRadius = 30.0,
    this.txtColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          border: Border.all(color: AppColor.kmaincolor),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.0,
              color: txtColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithdisable extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Color buttonColor;
  final Color txtColor;
  final double borderRadius;
  final bool disabled; // إضافة برمتر المعايير المعطلة

  const CustomButtonWithdisable({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColor.kmaincolor,
    this.borderRadius = 30.0,
    this.txtColor = Colors.white,
    this.disabled = false, // قيمة افتراضية للبرمتر المعايير المعطلة
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled
          ? null
          : onPressed, // تحقق من حالة المعايير المعطلة لتحديد إذا ما يجب تعطيل الزر أم لا
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: disabled
              ? Colors.grey
              : buttonColor, // تغيير لون الزر إذا كانت المعايير معطلة
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          border: Border.all(color: AppColor.kmaincolor),
        ),
        child: disabled == true
            ? Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: txtColor,
                  ),
                ),
              )
            : BuildAnimatedText(
                textanimate: buttonText,
                onPressedtext: onPressed,
              ),
      ),
    );
  }
}

class BuildAnimatedText extends StatelessWidget {
  const BuildAnimatedText(
      {super.key, required this.textanimate, required this.onPressedtext});
  final String textanimate;
  final Function()? onPressedtext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            textanimate,
            textStyle: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            colors: [
              Colors.black,
              Colors.black,
              Colors.blue,
              Colors.white,
              Colors.red,
              Colors.red,
              Colors.black,
            ],
          ),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
        onTap: onPressedtext,
      ),
    );
  }
}
//  Center(
//             child: AnimatedTextKit(
//               animatedTexts: [
//                 ColorizeAnimatedText(
//                   'Larry Page',
//                   textStyle: TextStyle(color: Colors.white, fontSize: 20),
//                   colors: [Colors.white, Colors.green, Colors.blue],
//                 ),
//               ],
//               isRepeatingAnimation: true,
//             ),
//           )),