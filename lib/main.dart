import 'package:drift_project/data/local/db/app_db.dart';
import 'package:drift_project/route/route_generator.dart';
import 'package:drift_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) => AppDb(),
      child: const MyApp(),
      dispose: (context, AppDb db) => db.close(),
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generatorRoute,
    );
  }
}
