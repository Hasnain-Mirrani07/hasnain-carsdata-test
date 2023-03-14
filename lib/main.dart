import 'package:flutter/material.dart';
import 'package:m_hasnain/view/splashscreen_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import 'data/models/hivemodel/carsdata_hivemodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  Hive.registerAdapter(CarsDataModelHiveAdapter());
  await Hive.openBox('NotesDatabase');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}
