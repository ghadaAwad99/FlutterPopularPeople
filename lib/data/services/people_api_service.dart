import 'dart:convert';
import 'package:flutter_popular_people_task/model/person_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_popular_people_task/model/person_model.dart';

class PeopleService {
  Future<List<Result>?> fetchPopularPeople() async {
    final response = await http.get(Uri.parse(
            "https://api.themoviedb.org/3/person/popular?api_key=bdee2da50a6d74db54386e74ecb18c4f&language=en-US&page=1"));

    if (response.statusCode == 200) {
      return PersonModel.fromJson(json.decode(response.body)).results;
    } else {
      throw ("Couldn't fetch people");
    }
  }

  Future<PersonDetailsModel> fetchPersonDetails(int id) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/person/$id?api_key=bdee2da50a6d74db54386e74ecb18c4f&language=en-US"));
    if (response.statusCode == 200) {
      return PersonDetailsModel.fromJson(json.decode(response.body));
    } else {
      throw ("Couldn't fetch people");
    }
  }
}
