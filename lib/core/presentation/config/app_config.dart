import 'package:flutter/material.dart';
import 'app_padding.dart';
import 'app_space.dart';
import 'app_text_style.dart';

class AppConfig {
  static init(BuildContext context) {
    AppTextStyle.init(context);
    AppSpace.init();
    AppPadding.init();
  }
}
