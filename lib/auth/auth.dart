import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/nav_bar.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final storage = new FlutterSecureStorage();



Future<void> signup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final DateTime dateTime = DateTime.now();

  saveUserInfoToFirestore() async{

    GoogleSignInAccount? gCurrentUser = googleSignIn.currentUser;
    User? user = auth.currentUser;
    var uid = user?.uid;

    if (googleSignInAccount != null) {
      await _firestore.collection("Users").doc(uid).set({
        "username": gCurrentUser?.displayName,
        "email": gCurrentUser?.email,
        "photoURL": gCurrentUser?.photoUrl,
        "creationDate": dateTime,
      });
    }
  }

  if (googleSignInAccount != null) {

    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    storeTokenAndData(result);
    User? user = result.user;

    await saveUserInfoToFirestore();

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }

}



Future<void> storeTokenAndData(UserCredential userCredential) async {
  await storage.write(
      key: "token", value: userCredential.credential?.token.toString());
  await storage.write(
      key: "userCredential", value: userCredential.toString());
}

Future<String?> getToken() async {
  return await storage.read(key: "token");
}
