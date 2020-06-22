import 'package:flutter/material.dart';
import 'package:muslim_app/Provider/QuranModel.dart';
import 'package:muslim_app/Provider/appState.dart';
import 'package:muslim_app/screen/splashPage.dart';


import 'package:provider/provider.dart';

import 'constants/colorConstants.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
//  final appDocumentDirectory = await  path_provider.getApplicationDocumentsDirectory();
//  Hive.init(appDocumentDirectory.path);
//  Hive.registerAdapter(UserAdapter());
//
//  await Hive.openBox("user");
//  final box = Hive.box("user");
//  User user = box.get('user', defaultValue: null);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>QuranModel()),
        ChangeNotifierProvider(create: (_) => AppState()),


      ],

      child: MyApp(
//        user: user,
      )));
}

class MyApp extends StatelessWidget {
//  final User user;

//  MyApp({this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: kPrimaryColor,
        backgroundColor: kPrimaryColor,

      ),

      home: SplashPage(
//        user: user,
      ),
    );
  }
}

