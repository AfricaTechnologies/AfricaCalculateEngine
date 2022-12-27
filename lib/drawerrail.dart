import 'package:flutter/material.dart';

class DrawerRail extends StatefulWidget {
  const DrawerRail({super.key});

  // Drawer Rail State
  @override
  State<DrawerRail> createState() => _DrawerRailState();
}

class _DrawerRailState extends State<DrawerRail> {
  bool showLeading = true;
  bool showTrailing = true;
  double groupAlignment = -1.0;
  int _selectedDestination = 0;
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;

  // Drawer Widget + Navigation Rail Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Textbooks'),
        ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Calculators',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_box_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(0);
              },
              selected: _selectedDestination == 0,
              title: const Text('Algebra'),
            ),
            ListTile(
              leading: const Icon(Icons.backpack_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(1);
              },
              selected: _selectedDestination == 1,
              title: const Text('Basic'),
            ),
            ListTile(
              leading: const Icon(Icons.calculate_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(2);
              },
              selected: _selectedDestination == 2,
              title: const Text('Calculus'),
            ),
            ListTile(
              leading: const Icon(Icons.landslide_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(3);
              },
              selected: _selectedDestination == 3,
              title: const Text('Lists'),
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(4);
              },
              selected: _selectedDestination == 4,
              title: const Text('Matrices'),
            ),
            ListTile(
              leading: const Icon(Icons.scale_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(5);
              },
              selected: _selectedDestination == 5,
              title: const Text('Statistics'),
            ),
            ListTile(
              leading: const Icon(Icons.terrain_rounded),
              onTap: () {
                Navigator.pop(context);
                selectDestination(6);
              },
              selected: _selectedDestination == 6,
              title: const Text('Trigonometry'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              elevation: 6,
              groupAlignment: groupAlignment,
              labelType: labelType,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              selectedLabelTextStyle: const TextStyle(color: Colors.black),
              leading: showLeading
                  ? FloatingActionButton(
                elevation: 6,
                onPressed: () {
                  Navigator.pushNamed(context, 'AboutCalculate');
                },
                tooltip: 'Textbook Page',
                child: const Icon(Icons.minimize_rounded),
              )
                  : const SizedBox(),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.add_box_outlined),
                  label: Text('Algebra and Trigonometry'),
                  selectedIcon: Icon(Icons.add_box_rounded),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.calculate_outlined),
                  label: Text('Calculus'),
                  selectedIcon: Icon(Icons.calculate_rounded),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.paragliding_outlined),
                  label: Text('Pre-Algebra'),
                  selectedIcon: Icon(Icons.paragliding_rounded),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.scale_outlined),
                  label: Text('Statistics'),
                  selectedIcon: Icon(Icons.scale_rounded),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
          ],
        ),
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
