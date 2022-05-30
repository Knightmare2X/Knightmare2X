import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyanAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade100,
              Colors.lightBlue.shade200,
              Colors.lightBlue.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.5, 0.99],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 34),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //png image
            FittedBox(
              child: Image.asset('assets/icons/icon_white.png',
                  height: 198,
                  width: 198,
                  fit: BoxFit.contain),
            ),
            //concord text
            const Text(
              'CONCORD',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Pacifico',
              ),
            ),
            const SizedBox(
              height: 147,
            ),
            //google signin
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(34)),
                  ),
              ),
              onPressed: ()
              {
                signup(context);
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 17,
                  ),
                  Image.asset(
                    'assets/icons/icon_google.png',
                    height: 34,
                    width: 34,
                  ),
                   const SizedBox(
                     width: 32,
                   ),
                    const Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            //continue with apple
          ],
        ),
      ),
    );
  }
}

