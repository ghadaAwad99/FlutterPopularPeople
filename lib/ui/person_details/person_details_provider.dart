import 'package:flutter/cupertino.dart';

import '../../data/repository/popular_people_repository.dart';
import '../../model/person_details_model.dart';

class PersonDetailsProvider extends ChangeNotifier {
  PersonDetailsModel? personDetails;
  final PeopleRepository _peopleRepository = PeopleRepository();

  PersonDetailsProvider(int id) {
    getPersonDetails(id);
  }

  void getPersonDetails(int id) {
    print("getPersonDetails inside provider");
    _peopleRepository.fetchPersonDetails(id).then((value) {
      personDetails = value;
      notifyListeners();
    });
  }
}
