import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() async {
  Map<String, String> result = {};

  for (int i = 1; i <= 114; i++) {
    var res = await http.get(Uri.parse("https://equran.id/api/v2/surat/$i"));

    var data = json.decode(res.body);

    for (var ayat in data['data']['ayat']) {
      String key = "${i}_${ayat['nomorAyat']}";
      result[key] = ayat['teksIndonesia'];
    }

    log("Surah $i selesai"); // biar tahu progress
  }

  File("id.json").writeAsStringSync(json.encode(result));
  log("✅ Selesai! File id.json berhasil dibuat");
}
