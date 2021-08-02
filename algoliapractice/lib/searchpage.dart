import 'package:flutter/material.dart';
import 'algoliaapp.dart';
import 'package:algolia/algolia.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  String _searchTerm = "";

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query =
        _algoliaApp.instance.index("practice_algolia").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Learning Algolia",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              TextField(
                  onChanged: (val) {
                    setState(() {
                      _searchTerm = val;
                    });
                  },
                  style: new TextStyle(color: Colors.black, fontSize: 20),
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search ...',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black))),
              StreamBuilder<List<AlgoliaObjectSnapshot>>(
                stream: Stream.fromFuture(_operation(_searchTerm)),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Text(
                      "Start Typing",
                      style: TextStyle(color: Colors.black),
                    );
                  else {
                    List<AlgoliaObjectSnapshot> currSearchStuff = snapshot.data
                        as List<AlgoliaObjectSnapshot>; //made changes

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container();
                      default:
                        if (snapshot.hasError)
                          return new Text('Error: ${snapshot.error}');
                        else
                          return CustomScrollView(
                            shrinkWrap: true,
                            slivers: <Widget>[
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    print(currSearchStuff[index].data);
                                    print("fuck");
                                    return _searchTerm.length > 0
                                        ? DisplaySearchResult(
                                            post_Title: currSearchStuff[index]
                                                .data["post_title"],
                                            authorName: currSearchStuff[index]
                                                .data["author_name"],
                                            categories: currSearchStuff[index]
                                                .data["categories"],
                                          )
                                        : Container();
                                  },
                                  childCount: currSearchStuff.length,
                                ),
                              ),
                            ],
                          );
                    }
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class DisplaySearchResult extends StatelessWidget {
  final String post_Title;
  final String authorName;
  final List<dynamic> categories;

  DisplaySearchResult(
      {Key? key,
      required this.authorName,
      required this.post_Title,
      required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(post_Title);
    return Column(children: <Widget>[
      Text(
        post_Title,
        style: TextStyle(color: Colors.black),
      ),
      Text(
        authorName,
        style: TextStyle(color: Colors.black),
      ),
      Text(
        categories.join(),
        style: TextStyle(color: Colors.black),
      ),
      Divider(
        color: Colors.black,
      ),
      SizedBox(height: 20)
    ]);
  }
}
