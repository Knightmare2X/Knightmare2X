import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget{

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 52,
                    fontFamily: 'Josefin' ,
                  ),
                ),
              ),
            ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  minimumSize: const Size.fromHeight(50),
                  // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 88),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),

            //Press
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },

            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10 ),
              child:Row(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.search)
                  ),
                  Container(
                    margin: const EdgeInsets.only( left: 10.0 ),
                    child: const Text(
                      "Search Cords",
                      style: TextStyle( fontSize: 20.0),
                    )
                  )
                ],
              ),
            ),

          ),
            // drawer: Drawer(),
          ],

        ),

      ),

    );
  }
}

class DataSearch extends SearchDelegate {
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("users");

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
  IconButton(
    icon: const Icon(Icons.close),
    onPressed: () {
      query = "";
    },
  ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        else{
          if (snapshot.data!.docs
          .where((QueryDocumentSnapshot<Object?> element) => element['username']
              .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
            .isEmpty) {
            return const Center(
              child: Text("No results found"),
            );
          }
          else
            {
              return ListView(children: [
                ...snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
        element['username']
        .toString()
        .toLowerCase()
        .contains(query.toLowerCase()))
                .map((QueryDocumentSnapshot<Object?> data) {
                  final String username = data.get('username');
                  final String image = data['photoUrl'];
                  final String name = data['name'];

                  return ListTile(
                    //Tapping result
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailsPage(data: data,)
                      //   )
                      // );
                    },
                    title: Text(username),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(image),
                    ),
                      subtitle: Text(name),
                  );
                })
              ]);
            }
        }
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    return const Center(child: Text("Search anything here"));
  }
}