import 'package:diyar_express/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'app/view/app_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //  final storage = await SharedPreferences.getInstance();
  runApp(const App());
}
