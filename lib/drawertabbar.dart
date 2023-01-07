import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:africa_calculate_engine/panellist.dart';

class DrawerTabBar extends StatefulWidget {
  const DrawerTabBar({super.key});

  // Drawer Tab Bar State
  @override
  State<DrawerTabBar> createState() => _DrawerTabBarState();
}

class _DrawerTabBarState extends State<DrawerTabBar>
    with TickerProviderStateMixin {
  final List<Item> _data = generateItems(1);
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,)) {
      throw 'Could not Launch: $url';
    }
  }
  int _selectedDestination = 0;
  late TabController _tabController;


  // Tab Controller State
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  // Drawer Widget + Tab Bar Widget
  @override
  Widget build(BuildContext context) {
    final Uri algebraTrigonometry = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/Algebra-and-Trigonometry-2e-WEB.pdf');
    final Uri detailsAlgebraTrigonometry = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/algebra-and-trigonometry-2e');
    final Uri calculusVolume1 = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/Calculus_Volume_1_-_WEB_68M1Z5W.pdf');
    final Uri detailsCalculusVolume1 = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/calculus-volume-1');
    final Uri calculusVolume2 = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/CalculusVolume2-OP.pdf');
    final Uri detailsCalculusVolume2 = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/calculus-volume-2');
    final Uri calculusVolume3 = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/CalculusVolume3-OP_mktoy8b.pdf');
    final Uri detailsCalculusVolume3 = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/calculus-volume-3');
    final Uri preAlgebra = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/Prealgebra2e-WEB.pdf');
    final Uri detailsPreAlgebra = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/prealgebra-2e');
    final Uri statistics = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/Statistics-WEB.pdf');
    final Uri detailsStatistics = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/statistics');
    FutureBuilder<void>(future: _launched, builder: _launchStatus);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textbooks'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.add_box_rounded),
              child: Text('Algebra and Trigonometry'),
            ),
            Tab(
              icon: Icon(Icons.calculate_rounded),
              child: Text('Calculus'),
            ),
            Tab(
              icon: Icon(Icons.paragliding_rounded),
              child: Text('Pre-Algebra'),
            ),
            Tab(
              icon: Icon(Icons.scale_rounded),
              child: Text('Statistics'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: ListView(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('lib/assets/algebra_trigonometry_2e.png'),
                        ExpansionPanelList.radio(
                          elevation: 6,
                          children: _data.map<ExpansionPanelRadio>((Item item) {
                            return ExpansionPanelRadio(
                              canTapOnHeader: true,
                              value: item.identity,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  leading: Icon(Icons.book_rounded),
                                  title: Text('Algebra and Trigonometry'),
                                  subtitle: Text('OpenStax, Rice University - Algebra and Trigonometry Second Edition'),
                                );},
                              body: ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(algebraTrigonometry);
                                    }),
                                  ),
                                  ElevatedButton(
                                    child: const Text('OpenStax'),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(detailsAlgebraTrigonometry);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
          Center(
            child: ListView(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('lib/assets/calculus-v1.png'),
                        ExpansionPanelList.radio(
                          elevation: 6,
                          children: _data.map<ExpansionPanelRadio>((Item item) {
                            return ExpansionPanelRadio(
                              canTapOnHeader: true,
                              value: item.identity,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  leading: Icon(Icons.book_rounded),
                                  title: Text('Calculus'),
                                  subtitle: Text('OpenStax, Rice University - Calculus Volume 1'),
                                );},
                              body: ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(calculusVolume1);
                                    }),
                                  ),
                                  ElevatedButton(
                                    child: const Text('OpenStax'),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(detailsCalculusVolume1);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('lib/assets/calculus-v2.png'),
                        ExpansionPanelList.radio(
                          elevation: 6,
                          children: _data.map<ExpansionPanelRadio>((Item item) {
                            return ExpansionPanelRadio(
                              canTapOnHeader: true,
                              value: item.identity,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  leading: Icon(Icons.book_rounded),
                                  title: Text('Calculus'),
                                  subtitle: Text('OpenStax, Rice University - Calculus Volume 2'),
                                );},
                              body: ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(calculusVolume2);
                                    }),
                                  ),
                                  ElevatedButton(
                                    child: const Text('OpenStax'),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(detailsCalculusVolume2);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('lib/assets/calculus-v3.png'),
                        ExpansionPanelList.radio(
                          elevation: 6,
                          children: _data.map<ExpansionPanelRadio>((Item item) {
                            return ExpansionPanelRadio(
                              canTapOnHeader: true,
                              value: item.identity,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  leading: Icon(Icons.book_rounded),
                                  title: Text('Calculus'),
                                  subtitle: Text('OpenStax, Rice University - Calculus Volume 3'),
                                );},
                              body: ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(calculusVolume3);
                                    }),
                                  ),
                                  ElevatedButton(
                                    child: const Text('OpenStax'),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(detailsCalculusVolume3);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
          Center(
            child: ListView(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('lib/assets/prealgebra_2e.png'),
                        ExpansionPanelList.radio(
                          elevation: 6,
                          children: _data.map<ExpansionPanelRadio>((Item item) {
                            return ExpansionPanelRadio(
                              canTapOnHeader: true,
                              value: item.identity,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  leading: Icon(Icons.book_rounded),
                                  title: Text('Pre-Algebra'),
                                  subtitle: Text('OpenStax, Rice University: Pre-Algebra Second Edition'),
                                );},
                              body: ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(preAlgebra);
                                    }),
                                  ),
                                  ElevatedButton(
                                    child: const Text('OpenStax'),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(detailsPreAlgebra);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
          Center(
            child: ListView(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('lib/assets/high_school_statistics.png'),
                        ExpansionPanelList.radio(
                          elevation: 6,
                          children: _data.map<ExpansionPanelRadio>((Item item) {
                            return ExpansionPanelRadio(
                              canTapOnHeader: true,
                              value: item.identity,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                  leading: Icon(Icons.book_rounded),
                                  title: Text('Statistics'),
                                  subtitle: Text('OpenStax, Rice University - Statistics'),
                                );},
                              body: ButtonBar(
                                alignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(statistics);
                                    }),
                                  ),
                                  ElevatedButton(
                                    child: const Text('OpenStax'),
                                    onPressed: () => setState(() {
                                      _launched = _launchInBrowser(detailsStatistics);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ],
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
    );
  }
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      throw 'Error: ${snapshot.error}';
    } else {
      throw 'Launched: $snapshot';
    }
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}