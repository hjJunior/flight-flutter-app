import 'package:flutter/material.dart';
import 'package:mvp/theme/colors.dart';

ThemeData get defaultTheme => ThemeData.light().copyWith(
  highlightColor: highlightColor,
  splashColor: highlightColor,
  dividerColor: dividerColor,
);
