import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Formatters {
  static String dateTimeToDate(DateTime dateTime) {
    initializeDateFormatting('pt_BR', null);
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  ///Método para formatar a data para ano/mes/dia - Padrão americano
  static String dateTimeToDateBackwards(DateTime dateTime) {
    initializeDateFormatting('pt_BR', null);
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  ///Método para formatar o value para moeda brasileira
  static String doubleToCurrency(double value) {
    return NumberFormat.currency(symbol: "R\$").format(value);
  }
}