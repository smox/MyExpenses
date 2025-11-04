// lib/util/decimal_ext.dart
import 'dart:ui' as ui show PlatformDispatcher;
import 'package:flutter/widgets.dart'; // für BuildContext (optional)
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

extension DecimalFormatting on Decimal {
  /// Dezimalzahl nach Locale formatiert (ohne Währungssymbol).
  /// Beispiel: 1234.56 -> "1.234,56" in de_AT
  String formatNumber({String? locale, int? fractionDigits}) {
    final resolvedLocale =
        (locale ?? ui.PlatformDispatcher.instance.locale.toLanguageTag())
            .replaceAll('-', '_');

    final nf = NumberFormat.decimalPattern(resolvedLocale);
    if (fractionDigits != null) {
      nf.minimumFractionDigits = fractionDigits;
      nf.maximumFractionDigits = fractionDigits;
    }
    return DecimalFormatter(nf).format(this);
  }

  /// Währungsformatierung. Nimmt das Locale aus dem BuildContext, wenn vorhanden,
  /// sonst aus den Systemeinstellungen. `currencySymbol` überschreibt das lokale Symbol.
  String formatCurrency({
    BuildContext? context,
    String? locale,
    bool useCurrencySymbol = true,
    int? fractionDigits,
  }) {
    final resolvedLocale = (locale ??
            (context != null
                ? Localizations.localeOf(context).toLanguageTag()
                : ui.PlatformDispatcher.instance.locale.toLanguageTag()))
        .replaceAll('-', '_');

    // Lookup: Symbol & Code automatisch holen
    final nfLookup = NumberFormat.simpleCurrency(locale: resolvedLocale);
    final symbol = nfLookup.currencySymbol;
    final code = nfLookup.currencyName;

    // Für das eigentliche Format ohne Symbol (da wir es manuell vorn anhängen)
    final nf = NumberFormat.decimalPattern(resolvedLocale);
    if (fractionDigits != null) {
      nf.minimumFractionDigits = fractionDigits;
      nf.maximumFractionDigits = fractionDigits;
    }

    final formatted = DecimalFormatter(nf).format(this);

    if (useCurrencySymbol) {
      return '$symbol $formatted'; // Symbol vorne
    } else {
      return '$formatted $code'; // z. B. "49,99 EUR"
    }
  }
}
