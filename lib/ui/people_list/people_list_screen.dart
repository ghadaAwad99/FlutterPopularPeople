import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popular_people_task/model/person_model.dart';
import 'package:flutter_popular_people_task/ui/people_list/people_list_provider.dart';
import 'package:provider/provider.dart';

import '../person_details/person_details_screen.dart';

class PeopleListScreen extends StatelessWidget {
  const PeopleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Popular People"),
        ),
        body: ChangeNotifierProvider<PeopleListProvider>(
          create: (context) => PeopleListProvider(),
          child: Consumer<PeopleListProvider>(
            builder: (buildContext, peopleListProvider, _) {
              return ListView.builder(
                  itemCount: peopleListProvider.peopleList!.length,
                  itemBuilder: (context, index) {
                    return PeopleListWidget(
                      person: peopleListProvider.peopleList![index],
                    );
                  });
              // Center(child: CircularProgressIndicator(),);
            },
          ),
        ));
  }
}

class PeopleListWidget extends StatelessWidget {
  const PeopleListWidget({Key? key, required this.person}) : super(key: key);

  final Result person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Hero(
                tag: person.name,
                child: Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://image.tmdb.org/t/p/w500/${person.profilePath}"),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          person.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                          //TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      Text(
                        person.known_for_department,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ]),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PersonDetailsScreen(person)));
        },
      ),
    );
  }
}
