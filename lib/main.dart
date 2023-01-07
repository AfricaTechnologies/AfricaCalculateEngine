import 'package:flutter/material.dart';
import 'package:africa_calculate_engine/aboutcalculate.dart';
import 'package:africa_calculate_engine/attextbook.dart';
import 'package:africa_calculate_engine/calctextbook.dart';
import 'package:africa_calculate_engine/drawerrail.dart';
import 'package:africa_calculate_engine/drawertabbar.dart';
import 'package:africa_calculate_engine/patextbook.dart';
import 'package:africa_calculate_engine/statstextbook.dart';

void main() {
  runApp(const CalculateEngine());
}

class CalculateEngine extends StatefulWidget {
  const CalculateEngine({super.key});

  // Calculate Engine State
  @override
  State<CalculateEngine> createState() => _CalculateEngineState();
}

class _CalculateEngineState extends State<CalculateEngine> {

  // Calculate Engine Material Application Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Africa Calculate Engine',
      theme: ThemeData(
          primaryColorDark: Colors.black,
          primarySwatch: Colors.blue,
      ),
      initialRoute: 'DrawerTabBar',
      routes: {
        'AboutCalculate': (context) => const AboutCalculate(),
        'ATTextbook': (context) => const ATTextbook(),
        'CalcTextbook': (context) => const CalcTextbook(),
        'DrawerRail': (context) => const DrawerRail(),
        'DrawerTabBar': (context) => const DrawerTabBar(),
        'PATextbook': (context) => const PATextbook(),
        'StatsTextbook': (context) => const StatsTextbook(),
      },
    );
  }
}