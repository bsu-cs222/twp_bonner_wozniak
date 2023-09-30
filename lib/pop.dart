import 'package:flutter/material.dart';
import 'package:two_week_project/revision_parser.dart';

import 'fetch_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body: SearchWidget()),
    );
  }
}

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  Future<String>? future;
  UrlBuilder urlBuilder= UrlBuilder();
  DataFetcher dataFetcher = DataFetcher();
  RevisionParser revisionParser= RevisionParser();
  @override
  Widget build(BuildContext context) {
    String revisedUrl=urlBuilder.getInformationFromUser(article: 'soup', limit: '4');
    if (future == null) {
      return Column(
        children: [
          const Text('Click to start'),
          ElevatedButton(
              onPressed: () =>
                  search(revisedUrl),
              child: const Text('Search')),
        ],
      );
    } else {
      return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('I got the data and it is');
          } else {
            return const Text('WAITING');
          }
        },
      );
    }
  }
  void search(String revisedUrl)async {
    String urlData= await dataFetcher.getDataFromInternet(revisedUrl);
    setState(() {
      future = Future.delayed(
        const Duration(seconds: 5),
            () => revisionParser.getTheMostRecentEditor(urlData),
      );
    });
  }
}