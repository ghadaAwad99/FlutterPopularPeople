import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popular_people_task/model/person_details_model.dart';
import 'package:flutter_popular_people_task/model/person_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../local_storage/db_helper.dart';
import '../services/people_api_service.dart';

class PeopleRepository {
  PeopleService _peopleService = PeopleService();

  Future<List<Result>?> fetchPopularPeople() async {
    print("fetchPopularPeople inside PeopleRepository");
    var connectivityResult = await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;
    Fluttertoast.showToast(
        msg: "you are online",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
    print("you are online");
    final peopleList = await _peopleService.fetchPopularPeople();
    return peopleList;
  }

  Future<PersonDetailsModel> fetchPersonDetails(int id) async {
    print("fetchPeopleDetails inside PeopleRepository");
    final personDetails = await _peopleService.fetchPersonDetails(id);
    return personDetails;
  }
}
