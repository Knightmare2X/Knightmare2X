import 'package:concord/auth/auth.dart';
import 'package:concord/screens/explore_screen.dart';
import 'package:concord/screens/nav_bar.dart';
import 'package:concord/screens/login_screen.dart';
import 'package:concord/screens/search_screen.dart';
import 'package:concord/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = LoginScreen();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin()async{
    String? token = await getToken();
    if(token!=null){
      setState(() {
        currentPage = SearchScreen();
      });
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      title: 'Concord',
      home: currentPage,
    );
  }
}



