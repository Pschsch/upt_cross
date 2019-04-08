import 'package:flutter/material.dart';

class ErrorSnackbar extends SnackBar{

  ErrorSnackbar({String text, String actionLabel, Color color, Function onPressed}): super(
      content: new Text(text),
      backgroundColor: color,
      action : new SnackBarAction(
          label: actionLabel,
          onPressed: onPressed)
  );
}