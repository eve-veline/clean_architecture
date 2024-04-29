import 'dart:convert';

import 'package:clean_archi/data/models/request/add_review_request.dart';
import 'package:clean_archi/data/models/response/add_review_model.dart';
import 'package:clean_archi/data/models/response/customer_review_model.dart';
import 'package:clean_archi/data/models/response/resto.dart';
import 'package:clean_archi/data/models/response/resto_detail.dart';
import 'package:clean_archi/data/models/response/resto_detail_response.dart';
import 'package:clean_archi/data/models/response/resto_response.dart';
import 'package:clean_archi/data/models/response/search_model.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/domain/entities/resto_response_entity.dart';
import 'package:http/http.dart' as http;

// abstract class ApiServiceDatasource {
//   Future<RestoModel> restoList();
// }

String baseUrl = "https://restaurant-api.dicoding.dev";

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  Future<List<RestoModel>> restoList() async {
    // var client = http.Client();
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

  Future<RestoDetailModel> detailResto(String id) async {
    String detailUrl = '/detail/';
    final response = await client.get(Uri.parse(baseUrl + detailUrl + id));

    if (response.statusCode == 200) {
      return RestoDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<SearchResponseModel> searchResto(String query) async {
    String searchUrl = '/search?q=';
    final response = await client.get(Uri.parse(baseUrl + searchUrl + query));
    if (response.statusCode == 200) {
      return SearchResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<CustomerReviewModel> addReview(AddReviewRequest request) async {
    String postUrl = '/review';
    final body = json.encode(request.toJson());
    final response = await client.post(
      Uri.parse(baseUrl + postUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      final List<dynamic> reviewsData = responseData['customerReviews'];
      return CustomerReviewModel.fromJson(reviewsData.last);
    } else {
      throw Exception('Failed to add review');
    }
  }
}
