import 'package:flutter/cupertino.dart';
import 'package:flutter_popular_people_task/model/person_model.dart';

import '../../data/repository/popular_people_repository.dart';

class PeopleListProvider extends ChangeNotifier {
  List<Result>? peopleList = [];

  final PeopleRepository _peopleRepository = PeopleRepository();

  PeopleListProvider() {
    getPopularPeople();
  }

  void getPopularPeople() {
    _peopleRepository.fetchPopularPeople().then((value) {
      peopleList = value;
      notifyListeners();
    });
  }
}
