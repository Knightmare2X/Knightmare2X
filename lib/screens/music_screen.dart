import 'package:concord/model/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/image_data.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // implement the massonry layout
        body: SafeArea(
      child: MasonryGridView.count(
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
    ));
  }
}


