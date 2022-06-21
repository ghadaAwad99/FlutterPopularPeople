import 'package:flutter/material.dart';
import 'package:flutter_popular_people_task/model/person_model.dart';
import 'package:flutter_popular_people_task/ui/person_details/person_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PersonDetailsScreen extends StatelessWidget {
  final Result person;

  const PersonDetailsScreen(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    // String release = dateFormat
    //   .format(person.knownFor[0]!.); //Converting DateTime object to String

    // return new ListView(
    //   children: children,
    //);
    return Scaffold(
        appBar: AppBar(
          title: Text(person.name),
        ),
        body: ChangeNotifierProvider<PersonDetailsProvider>(
          create: (context) => PersonDetailsProvider(person.id),
          child: Consumer<PersonDetailsProvider>(
            builder: (buildContext, personDetailsProvider, _) {
              final children = <Widget>[];
              for (var i = 0; i < person.knownFor.length; i++) {
                children.add(ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      height: 400,
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${person.knownFor[i].posterPath}")),
                ));
                children.add(const Padding(padding: EdgeInsets.all(5.0)));
              }
              return SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Hero(
                          tag: person.name,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${person.profilePath}")),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        ElevatedButton(
                            onPressed: () async {
                              String url =
                                  "https://image.tmdb.org/t/p/w500/${person.profilePath}";
                              await GallerySaver.saveImage(url,
                                  albumName: 'popular_people');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Photo Downloaded Successfully.")));
                            },
                            child: const Text("Download Image")),
                        const Text(
                          "Biography:",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              personDetailsProvider.personDetails?.biography ??
                                  ""),
                        ),
                        const Text(
                          "Department:",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(personDetailsProvider
                                  .personDetails?.knownForDepartment ??
                              ""),
                        ),
                        const Text(
                          "Known For: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: children,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                      ],
                    )),
              );

              // Center(child: CircularProgressIndicator(),);
            },
          ),
        ));
  }
}
