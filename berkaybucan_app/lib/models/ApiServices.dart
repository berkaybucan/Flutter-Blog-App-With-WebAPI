import 'package:berkaybucan_app/models/Blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  static String blgListeleURL = "http://192.168.56.1:7246/Blog/Listele";
  static String blgEkleURL = "http://192.168.56.1:7246/Blog/Ekle";
  static String blgDuzenleURL = "http://192.168.56.1:7246/Blog/Guncelle";
  static String blgSilURL = "http://192.168.56.1:7246/Blog/Sil";

  static Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json",
  };
  static Future BlogListele() async {
    var response =
        await http.get(Uri.parse("http://192.168.56.1:7246/Blog/Listele"));
    if (response.statusCode == 200) {
    } else {
      print("Hata oluştu");
    }
    return response.body;
  }

  static Future<bool> BlogEkle(Blog blg) async {
    var blgMap = blg.toMap();
    blgMap.remove("blogId");
    var blgJson = json.encode(blgMap);
    var response =
        await http.post(Uri.parse(blgEkleURL), body: blgJson, headers: header);

    return Future.value(response.statusCode == 200 ? true : false);
  }

  static Future<bool> IcerikGuncelle(Blog blg) async {
    var blgMap = blg.toMap();
    var blgJson = json.encode(blgMap);
    var response = await http.post(Uri.parse(blgDuzenleURL),
        body: blgJson, headers: header);

    return Future.value(response.statusCode == 200 ? true : false);
  }

  static Future<bool> IcerikSil(Blog blg) async {
    var blgMap = blg.toMap();
    var blgJson = json.encode(blgMap);
    var response =
        await http.post(Uri.parse(blgSilURL), body: blgJson, headers: header);

    return Future.value(response.statusCode == 200 ? true : false);
  }
}
