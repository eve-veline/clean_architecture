import 'dart:convert';

import 'package:clean_archi/data/models/resto.dart';
import 'package:clean_archi/data/models/resto_response.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:http/http.dart' as http;


String baseUrl = "https://restaurant-api.dicoding.dev";

class ApiService {
  Future<List<RestoModel>> restoList() async {
    var client = http.Client();
    String listUrl = "/list";
    final response = await client.get(Uri.parse(baseUrl + listUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['error'] == false && data['message'] == 'success') {
        List<dynamic> restaurants = data['restaurants'];
        List<RestoModel> restoList = [];
        for (int i = 0; i < restaurants.length; i++) {
          RestoModel resto = RestoModel.fromJson(restaurants[i]);
          // Konversi nilai rating menjadi double jika diperlukan
          double rating = resto.rating.toDouble();
          // Buat objek RestoModel baru dengan nilai rating yang telah dikonversi
          RestoModel newResto = RestoModel(
            id: resto.id,
            name: resto.name,
            description: resto.description,
            pictureId: resto.pictureId,
            city: resto.city,
            rating: rating,
          );
          restoList.add(newResto); // Tambahkan objek RestoModel ke dalam daftar
        }
        return restoList;
      } else {
        throw Exception('Failed to load: ${data['message']}');
      }
    } else {
      throw Exception('Failed to load');
    }
  }
}
