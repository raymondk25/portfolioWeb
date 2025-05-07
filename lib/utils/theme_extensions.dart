import 'package:flutter/material.dart';

// Extension to add the missing backgroundColor property that Get is looking for
extension ThemeDataExtensions on ThemeData {
  Color get backgroundColor => this.colorScheme.background;
}
