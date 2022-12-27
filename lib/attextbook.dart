import 'package:flutter/material.dart';
import 'package:africa_calculate_engine/panellist.dart';

class ATTextbook extends StatefulWidget {
  const ATTextbook({super.key});

  // Algebra and Trigonometry Textbook State
  @override
  State<ATTextbook> createState() => _ATTextbookState();
}

class _ATTextbookState extends State<ATTextbook> {
  final List<Item> _data = generateItems(1);

  // Algebra and Trigonometry Textbook Card Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algebra and Trigonometry'),
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