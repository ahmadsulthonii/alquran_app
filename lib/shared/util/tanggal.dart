import 'package:intl/intl.dart';
import 'package:quran_app/service/local_data_service.dart';

String formatHari(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  var day = DateFormat('EEEE').format(dateTime);
  var hari = "";
  switch (day) {
    case 'Sunday':
      {
        hari = "Minggu";
      }
      break;
    case 'Monday':
      {
        hari = "Senin";
      }
      break;
    case 'Tuesday':
      {
        hari = "Selasa";
      }
      break;
    case 'Wednesday':
      {
        hari = "Rabu";
      }
      break;
    case 'Thursday':
      {
        hari = "Kamis";
      }
      break;
    case 'Friday':
      {
        hari = "Jum'at";
      }
      break;
    case 'Saturday':
      {
        hari = "Sabtu";
      }
      break;
  }
  return hari;
}

String formatJam(String tanggal, {bool showZona = true}) {
  if (tanggal != "") {
    DateTime dt = DateTime.parse(tanggal);
    String jam = DateFormat('HH:mm').format(dt);

    if (showZona) {
      return '$jam ${LocalDataService.get("zonaWaktu")!}';
    }

    return jam;
  } else {
    return "- : -";
  }
}

String formatTanggalSlash(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  return DateFormat("dd/MM/yyyy").format(dateTime);
}

DateTime? parseDynamicDate(String tanggal) {
  List<String> formats = [
    "yyyy-MM-dd",
    "yyyy-MM-dd HH:mm",
    "dd-MM-yyyy",
    "MM/dd/yyyy",
    "yyyy/MM/dd HH:mm",
    "dd MMMM yyyy",
  ];

  for (String format in formats) {
    try {
      return DateFormat(format).parse(tanggal);
    } catch (e) {
      continue;
    }
  }
  return null;
}

String formatTglIndo(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  var m = DateFormat('MM').format(dateTime);
  var d = DateFormat('dd').format(dateTime).toString();
  var Y = DateFormat('yyyy').format(dateTime).toString();
  var month = "";

  switch (m) {
    case '01':
      month = "Januari";
      break;
    case '02':
      month = "Februari";
      break;
    case '03':
      month = "Maret";
      break;
    case '04':
      month = "April";
      break;
    case '05':
      month = "Mei";
      break;
    case '06':
      month = "Juni";
      break;
    case '07':
      month = "Juli";
      break;
    case '08':
      month = "Agustus";
      break;
    case '09':
      month = "September";
      break;
    case '10':
      month = "Oktober";
      break;
    case '11':
      month = "November";
      break;
    case '12':
      month = "Desember";
      break;
  }
  return "$d $month $Y";
}

String formatTglIndoSingkat(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  var m = DateFormat('MM').format(dateTime);
  var d = DateFormat('dd').format(dateTime).toString();
  var Y = DateFormat('yyyy').format(dateTime).toString();
  var month = "";

  switch (m) {
    case '01':
      month = "Jan";
      break;
    case '02':
      month = "Feb";
      break;
    case '03':
      month = "Mar";
      break;
    case '04':
      month = "Apr";
      break;
    case '05':
      month = "Mei";
      break;
    case '06':
      month = "Juni";
      break;
    case '07':
      month = "Juli";
      break;
    case '08':
      month = "Agust";
      break;
    case '09':
      month = "Sept";
      break;
    case '10':
      month = "Okt";
      break;
    case '11':
      month = "Nov";
      break;
    case '12':
      month = "Des";
      break;
  }
  return "$d $month $Y";
}

String formatBlnThn(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  var m = DateFormat('MM').format(dateTime);
  var Y = DateFormat('yyyy').format(dateTime).toString();
  var month = "";

  switch (m) {
    case '01':
      month = "Jan";
      break;
    case '02':
      month = "Feb";
      break;
    case '03':
      month = "Mar";
      break;
    case '04':
      month = "Apr";
      break;
    case '05':
      month = "Mei";
      break;
    case '06':
      month = "Jun";
      break;
    case '07':
      month = "Jul";
      break;
    case '08':
      month = "Agust";
      break;
    case '09':
      month = "Sep";
      break;
    case '10':
      month = "Okt";
      break;
    case '11':
      month = "Nov";
      break;
    case '12':
      month = "Des";
      break;
  }
  return "$month $Y";
}

String formatTglBln(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  var m = DateFormat('MM').format(dateTime);
  var d = DateFormat('dd').format(dateTime).toString();
  var month = "";

  switch (m) {
    case '01':
      month = "Jan";
      break;
    case '02':
      month = "Feb";
      break;
    case '03':
      month = "Mar";
      break;
    case '04':
      month = "April";
      break;
    case '05':
      month = "Mei";
      break;
    case '06':
      month = "Juni";
      break;
    case '07':
      month = "Juli";
      break;
    case '08':
      month = "Agust";
      break;
    case '09':
      month = "Sept";
      break;
    case '10':
      month = "Okt";
      break;
    case '11':
      month = "Nov";
      break;
    case '12':
      month = "Des";
      break;
  }
  return "$d $month ";
}

String formatTgl(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  return DateFormat("dd").format(dateTime);
}

String formatTanggal(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  return DateFormat("dd-MM-yyyy").format(dateTime);
}

/* Format YYYY-MM-DD */
String formatTglParam(DateTime date) {
  return "${date.year.toString().padLeft(4, '0')}-"
      "${date.month.toString().padLeft(2, '0')}-"
      "${date.day.toString().padLeft(2, '0')}";
}

String formatBulan(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  var m = DateFormat('MM').format(dateTime);
  var month = "";
  switch (m) {
    case '01':
      {
        month = "Januari";
      }
      break;
    case '02':
      {
        month = "Februari";
      }
      break;
    case '03':
      {
        month = "Maret";
      }
      break;
    case '04':
      {
        month = "April";
      }
      break;
    case '05':
      {
        month = "Mei";
      }
      break;
    case '06':
      {
        month = "Juni";
      }
      break;
    case '07':
      {
        month = "Juli";
      }
      break;
    case '08':
      {
        month = "Agustus";
      }
      break;
    case '09':
      {
        month = "September";
      }
      break;
    case '10':
      {
        month = "Oktober";
      }
      break;
    case '11':
      {
        month = "November";
      }
      break;
    case '12':
      {
        month = "Desember";
      }
      break;
  }
  return month;
}

String formatTahun(String tanggal) {
  DateTime? dateTime = parseDynamicDate(tanggal);
  if (dateTime == null) return "-";

  return DateFormat("yyyy").format(dateTime);
}

String hariFromKode(int kode) {
  switch (kode) {
    case 1:
      return "Senin";
    case 2:
      return "Selasa";
    case 3:
      return "Rabu";
    case 4:
      return "Kamis";
    case 5:
      return "Jum'at";
    case 6:
      return "Sabtu";
    case 7:
      return "Minggu";
    default:
      return "";
  }
}
