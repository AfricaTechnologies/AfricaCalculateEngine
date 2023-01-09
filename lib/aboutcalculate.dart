import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:africa_calculate_engine/panellist.dart';

class AboutCalculate extends StatefulWidget {
  const AboutCalculate({super.key});

  // About Calculate State
  @override
  State<AboutCalculate> createState() => _AboutCalculateState();
}

class _AboutCalculateState extends State<AboutCalculate> {
  final List<Item> _data = generateItems(1);
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,)) {
      return debugPrint('Could not Launch: $url');
    }
  }

  // About Calculate Card Widget
  @override
  Widget build(BuildContext context) {
    final Uri toGitHub = Uri(scheme: 'https', host: 'github.com', path: 'AfricaTechnologies');
    final Uri toSource = Uri(scheme: 'https', host: 'github.com', path: 'AfricaTechnologies/AfricaCalculateEngine');
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
        title: const Text('About'),
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
                    Image.asset('lib/assets/ACEPlayStore.png'),
                    ExpansionPanelList.radio(
                      elevation: 6,
                      children: _data.map<ExpansionPanelRadio>((Item item) {
                        return ExpansionPanelRadio(
                          canTapOnHeader: true,
                          value: item.identity,
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return const ListTile(
                              leading: Icon(Icons.book_rounded),
                              title: Text('About'),
                              subtitle: Text('Africa Calculate Engine is an Open Source Mathematics Engine and Open Educational Resource. The function is to provide Calculators, Open Textbooks, Scans, Steps and promote OpenStax, Rice University.'),
                            );},
                          body: ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text('GitHub Projects'),
                                onPressed: () => setState(() {
                                  _launched = _launchInBrowser(toGitHub);
                                }),
                              ),
                              ElevatedButton(
                                child: const Text('Source'),
                                onPressed: () => setState(() {
                                  _launched = _launchInBrowser(toSource);
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
