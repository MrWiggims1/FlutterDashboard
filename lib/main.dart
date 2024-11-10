import 'package:flutter/material.dart';

import 'ProductionData/production_access.dart';
import 'models/van/van.dart';

void main() async{
  runApp(const MainApp());

  await ProductionAccess.GetCheck("671630466e1952a94227e14f");

  van = await ProductionAccess.GetVanByName("exp095");
}

Van? van;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    if(van != null)
      {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text("$van"),
            ),
          ),
        );
      }

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}