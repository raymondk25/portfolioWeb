import 'package:flutter/material.dart';
// Note: dart:html is still needed for web apps but is deprecated.
// We'll keep this for now with the ignore comment
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:portofolio_web/components/elevate_on_hover.dart';

extension HoverExtension on Widget {
  // Document access is still needed for web functionality
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get moveUpOnHover {
    return ElevateOnHover(child: this);
  }
}
