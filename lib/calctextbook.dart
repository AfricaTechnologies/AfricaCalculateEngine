import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:africa_calculate_engine/panellist.dart';

class CalcTextbook extends StatefulWidget {
  const CalcTextbook({super.key});

  // Calculus Textbook State
  @override
  State<CalcTextbook> createState() => _CalcTextbookState();
}

class _CalcTextbookState extends State<CalcTextbook> {
  final List<Item> _data = generateItems(1);
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,)) {
      return debugPrint('Could not Launch: $url');
    }
  }

  // Calculus Textbook Card Widget
  @override
  Widget build(BuildContext context) {
    final Uri calculusVolume1 = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/Calculus_Volume_1_-_WEB_68M1Z5W.pdf');
    final Uri detailsCalculusVolume1 = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/calculus-volume-1');
    final Uri calculusVolume2 = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/CalculusVolume2-OP.pdf');
    final Uri detailsCalculusVolume2 = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/calculus-volume-2');
    final Uri calculusVolume3 = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/CalculusVolume3-OP_mktoy8b.pdf');
    final Uri detailsCalculusVolume3 = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/calculus-volume-3');
    FutureBuilder<void>(future: _launched, builder: _launchStatus);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.info_outline_rounded),
                  onPressed: () {

                  }
              ),
              IconButton(
                  icon: const Icon(Icons.settings_applications_outlined),
                  onPressed: () {

                  }
              ),
            ],
          ),
        ],
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
    );
  }
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      throw 'Error: ${snapshot.error}';
    } else {
      throw 'Launched: $snapshot';
    }
  }
}
