part of ext;

const serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
const clientDateFormat = 'dd MMMM yyyy';

extension DateTimeExt on DateTime {
  // String changeFormatDate(
  //     {required String dateString,
  //     String inputFormat = serverDateFormat,
  //     String outPutFormat = clientDateFormat,
  //     bool isUtc = false}) {
  //   String result = '-';
  //   try {
  //     final DateFormat dateFormatInput = DateFormat(inputFormat);
  //     final DateFormat dateFormatOutput = DateFormat(outPutFormat);
  //     final DateTime time = dateFormatInput.parse(dateString, isUtc).toLocal();
  //     result = dateFormatOutput.format(time);
  //   } catch (e) {
  //     log('ERROR::CHANGE_DATE_FORMAT => $e');
  //   }
  //   return result;
  // }
}

// static String changeDateFormat(
//       {required String dateString,
//       String inputFormat = SERVER_DATE_FORMAT,
//       String outPutFormat = CLIENT_DATE_FORMAT,
//       bool isUtc = false}) {
//     String result = '-';
//     try {
//       final DateFormat dateFormatInput = DateFormat(inputFormat);
//       final DateFormat dateFormatOutput = DateFormat(outPutFormat);
//       final DateTime time = dateFormatInput.parse(dateString, isUtc).toLocal();
//       result = dateFormatOutput.format(time);
//     } catch (e) {
//       logger('ERROR::CHANGE_DATE_FORMAT => $e');
//     }
//     return result;
//   }