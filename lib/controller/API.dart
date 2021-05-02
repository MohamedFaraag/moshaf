import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:moshaf/model/JuzzModel.dart';
import 'package:moshaf/view/juzzIndex.dart';
//---------------MODELS---------------
import '../model/SurahModel.dart';
import '../model/SajdaModel.dart';

class API {
  String domain = 'http://api.alquran.cloud/v1';
  Future<SurahModel> getAllSurah() async {
    String url = '$domain/quran/quran-uthmani';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return SurahModel.fromJson(json.decode(response.body));
    } else {
      print('FAILED TO LOAD SURAH');
      throw Exception('FAILED TO LOAD SURAH');
    }
  }

  Future<SajdaModel> getAllSajda() async {
    String url = '$domain/sajda/quran-uthmani';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return SajdaModel.fromJson(json.decode(response.body));
    } else {
      print('FAILED TO LOAD SAJDA');
      throw Exception('FAILED TO LOAD SAJDA');
    }
  }

  Future<JuzzModel> getAllJuzz(int index) async {
    String url = '$domain/juz/$index/quran-uthmani';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return JuzzModel.fromJson(json.decode(response.body));
    } else {
      print('FAILED TO LOAD JUZZ');
      throw Exception('FAILED TO LOAD JUZZ');
    }
  }
}
