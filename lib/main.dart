import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing_firebase/auth/email_page.dart';
import 'package:testing_firebase/auth/signup_page.dart';
import 'package:testing_firebase/firebase_options.dart';
import 'package:testing_firebase/theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  await auth.useAuthEmulator("10.0.2.2", 9099);
  fireStore.useFirestoreEmulator("10.0.2.2", 8080);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      title: 'Test',
      home: const EmailPage(),
    );
  }
}
