import 'package:intl/intl.dart';
import 'dart:ui' as ui;

extension DateTimeFormatting on DateTime {
  String toLocaleDateTime() {
    var locale = ui.PlatformDispatcher.instance.locale.toLanguageTag();
    return DateFormat.yMd(locale).add_Hm().format(this);
  }
}
