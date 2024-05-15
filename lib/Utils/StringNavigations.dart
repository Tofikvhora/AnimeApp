import 'package:flutter/cupertino.dart';

extension Navigation on String {
  pushAndReplace(BuildContext context) {
    Navigator.pushReplacementNamed(context, this);
  }

  pushOnThis(BuildContext context) {
    Navigator.pushNamed(context, this);
  }
}
