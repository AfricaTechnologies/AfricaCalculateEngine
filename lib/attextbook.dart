import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:africa_calculate_engine/panellist.dart';

class ATTextbook extends StatefulWidget {
  const ATTextbook({super.key});

  // Algebra and Trigonometry Textbook State
  @override
  State<ATTextbook> createState() => _ATTextbookState();
}

class _ATTextbookState extends State<ATTextbook> {
  final List<Item> _data = generateItems(1);
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,)) {
      return debugPrint('Could not Launch: $url');
    }
  }

  // Algebra and Trigonometry Textbook Card Widget
  @override
  Widget build(BuildContext context) {
    final Uri algebraTrigonometry = Uri(scheme: 'https', host: 'assets.openstax.org', path: 'oscms-prodcms/media/documents/Algebra-and-Trigonometry-2e-WEB.pdf');
    final Uri detailsAlgebraTrigonometry = Uri(scheme: 'https', host: 'openstax.org', path: 'details/books/algebra-and-trigonometry-2e');
    FutureBuilder<void>(future: _launched, builder: _launchStatus);
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