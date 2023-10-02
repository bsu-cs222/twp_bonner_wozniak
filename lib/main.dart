
import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _messege = 'Enter in article name';
  final _controller = TextEditingController();
  final _controller2=TextEditingController();
  @override
  Widget build(BuildContext context){
      return Column(
        children: [
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          Padding(
            padding: const EdgeInsets.all(70),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Article name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(70),
            child: TextField(
              controller: _controller2,
              decoration: const InputDecoration(labelText: 'Number of Entries'),
              keyboardType: TextInputType.number,
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
  void _onButtonPressed(){
    setState(() {
      final builder = UrlBuilder();
      final dataFetcher = DataFetcher();
      final parser = RevisionParser();
      String article = _controller.text;
      int limit = int.parse(_controller2.text);
      String userInformation = builder.getInformationFromUser(article: article , limit: limit);
      final urlInformation = dataFetcher.getDataFromInternet(userInformation);
      Future<String> convertFutureToString() async{
        return Future.value(urlInformation);
      }
      void convert()async{
        Future<String> string = convertFutureToString();
        String url = await string;
        print(limit);
        final userInformation = parser.getMostRecentEditors(url, limit);
        _messege = userInformation;
      }
      convert();
      _controller.clear();
      _controller2.clear();
    });
  }

}
