import 'package:concord/model/image_card.dart';
import 'package:concord/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/image_data.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //inside body add SingleChildScrollView
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                  child: const Center(
                      child: Text(
                          'Explore',
                        style: TextStyle(
                          fontSize: 52,
                          fontFamily: 'Josefin' ,
                        ),
                      ),
                  ),
              ),
              GestureDetector(
                onTap: (){
                },
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: imageList.length,
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  // the number of columns
                  crossAxisCount: 2,
                  // vertical gap between two items
                  mainAxisSpacing: 8,
                  // horizontal gap between two items
                  crossAxisSpacing: 8,
                  itemBuilder: (context, index) => ImageCard(
                    imageData: imageList[index],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


