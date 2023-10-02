
import 'package:flutter/material.dart';
import 'package:two_week_project/change_url.dart';

import 'package:two_week_project/fetch_data.dart';
import 'package:two_week_project/recent_editors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor:Colors.redAccent),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _messege = 'Enter in article name';
  final _userArticleInput = TextEditingController();
  final _userLimitInput=TextEditingController();
  @override
  Widget build(BuildContext context){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _userArticleInput,
              decoration: const InputDecoration(labelText: 'Article name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _userLimitInput,
              decoration: const InputDecoration(labelText: 'Number of Entries'),
              keyboardType: TextInputType.text,
            ),
          ),
          //   ],
          // ),
          ElevatedButton(
              onPressed: _onButtonPressed,
              child: const Text(
                  'Get Recent Editor'
              )),
          Text(_messege),

        ],
      );
  }
  void _onButtonPressed()async{
    final builder = UrlBuilder();
    final dataFetcher = DataFetcher();
    final parser = RevisionParser();
    String article = _userArticleInput.text;
    int limit = int.parse(_userLimitInput.text);
    String url = builder.build(name: article, limit: limit);
    final urlInformation = dataFetcher.getDataFromInternet(url);
    String userInformation;

    Future<String> convertFutureToString() async{
      return Future.value(urlInformation);
    }

    Future<String> future = convertFutureToString();
    String convertedFuture = await future;
    userInformation = parser.getMostRecentEditors(convertedFuture, limit);

    setState(() {
      _messege = userInformation;
      _userArticleInput.clear();
      _userLimitInput.clear();
    });
  }

}
