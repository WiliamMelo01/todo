import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/Home/home.dart';

Future<void> main()async{
  await Hive.initFlutter();
  await Hive.openBox('tasks');

  runApp(const App());
}

class App extends StatelessWidget {
const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
      theme:  ThemeData(
        primarySwatch: Colors.yellow
      ),
    );
  }
}