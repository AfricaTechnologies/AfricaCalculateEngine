import 'package:flutter/material.dart';
import 'package:africa_calculate_engine/panellist.dart';

class CalcTextbook extends StatefulWidget {
  const CalcTextbook({super.key});

  // Calculus Textbook State
  @override
  State<CalcTextbook> createState() => _CalcTextbookState();
}

class _CalcTextbookState extends State<CalcTextbook> {
  final List<Item> _data = generateItems(1);

  // Calculus Textbook Card Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculus'),
      ),
      body: Center(
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
                                onPressed: () {

                                },
                              ),
                              TextButton(
                                child: const Text('OpenStax'),
                                onPressed: () {

                                },
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
                                onPressed: () {

                                },
                              ),
                              TextButton(
                                child: const Text('OpenStax'),
                                onPressed: () {

                                },
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
                                onPressed: () {

                                },
                              ),
                              TextButton(
                                child: const Text('OpenStax'),
                                onPressed: () {

                                },
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
    );
  }
}