import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HumanFormats {
  static Future<void> initialize() async {
    await initializeDateFormatting('es_ES', null);
  }

  static String number(double number, [int decimals = 0]) {
    final formatterNumber = NumberFormat.compactCurrency(
            decimalDigits: decimals, symbol: '', locale: 'en')
        .format(number);

    return formatterNumber;
  }

  static String dateFormat({required DateTime date, String format = 'EEEE d'}) {
    final formatter = DateFormat(format, 'es_ES');
    final formattedDate = formatter.format(date);

    return toBeginningOfSentenceCase(formattedDate);
  }
}
