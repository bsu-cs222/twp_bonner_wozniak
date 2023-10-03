
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
  String _messege = 'Enter In Article Name And Number of Desired Editors';
  final _userArticleInput=TextEditingController();
  final _userLimitInput=TextEditingController();
  @override
  Widget build(BuildContext context){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: TextField(
              controller: _userArticleInput,
              decoration: const InputDecoration(labelText: 'Article Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: TextField(
              controller: _userLimitInput,
              decoration: const InputDecoration(labelText: 'Number of Editors'),
              keyboardType: TextInputType.text,
            ),
          ),
          ElevatedButton(
              onPressed: _onButtonPressed,
              child: const Text(
                  'Get Recent Changes'
              )
          ),
          Expanded(child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(_messege,style:const TextStyle
              (fontSize:20,fontWeight: FontWeight.bold)
            ),
          ),
          ),

        ],
      );
  }
  void _onButtonPressed()async{
    final urlBuilder = UrlBuilder();
    final dataFetcher = DataFetcher();
    final parser = RevisionParser();
    String article = _userArticleInput.text;
    int limit = int.parse(_userLimitInput.text);
    String url = urlBuilder.build(articleName: article, numberOfEditors: limit);
    final urlInformation = dataFetcher.getDataFromWikipedia(url);
    Future<String> convertFutureToString() async{
      return Future.value(urlInformation);
    }
    Future<String> urlInformationAsFuture = convertFutureToString();
    String convertedUrlInformation = await urlInformationAsFuture;
    String editorInformation = parser.getMostRecentEditors(convertedUrlInformation, limit);
    setState(() {
      _messege = editorInformation;
      _userArticleInput.clear();
      _userLimitInput.clear();
    });
  }
}
