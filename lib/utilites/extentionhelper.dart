import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenheight => MediaQuery.of(this).size.height;
  double get screenwidth => MediaQuery.of(this).size.width;
}

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}

extension NavigatorreplacementHelper on BuildContext {
  void pushrepacement(Widget widget) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
