import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
