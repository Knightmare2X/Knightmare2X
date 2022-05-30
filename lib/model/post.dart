import 'package:concord/model/image_card.dart';
import 'package:concord/model/image_data.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final ImageCard imageCard;
  Post(this.imageCard);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
