import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:veggiez/style/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  onChange,
  onTap,
  bool isPassword = false,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  void Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required Function() onPressed,
  required String text,
  bool isUpperCase = false,
  Color? color,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: color,
        ),
      ),
    );

Widget defaultButton({
  required void Function()? onPressed,
  required String text,
  Color? textColor = Colors.white,
  double Width = 328,
  double height = 59.2,
  Color? backgroundColor = defaultColor,
  double radius = 10.0,
  bool isUpperCase = true,
}) =>
    Container(
      width: Width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false);
}

SmoothPageIndicator defaultIndicator({
  required controller,
  required dynamic count,
}) =>
    SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: CustomizableEffect(
        dotDecoration: DotDecoration(
          color: Color(0xFFE1DEDE),
          width: 8,
          height: 8,
          borderRadius: BorderRadius.circular(
            4.0,
          ),
        ),
        activeDotDecoration: DotDecoration(
          color: defaultMaterialColor,
          height: 8,
          width: 24,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    );

void showToast({required String msg, required color}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
