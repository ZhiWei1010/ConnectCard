import 'package:connectcard/models/theUser.dart';
import 'package:connectcard/screens/contacts/contactpage.dart';
import 'package:connectcard/screens/home/home.dart';
import 'package:connectcard/screens/home/profilepage.dart';
import 'package:connectcard/screens/scan/ocr/ocr.dart';
import 'package:connectcard/screens/wrapper.dart';
import 'package:connectcard/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      value: Auth().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          '/home': (context) => Home(),
          '/scan': (context) => OcrScreen(),
          //'/mycards': (context) => MyCardScreen(),
          '/contacts': (context) => ContactPage(),
          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}
